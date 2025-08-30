import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class TaskService {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksJson = prefs.getString('tasks');
    if (tasksJson != null) {
      final List decoded = jsonDecode(tasksJson);
      _tasks.clear();
      _tasks.addAll(decoded.map((e) => Task.fromJson(e)).toList());
    }
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(_tasks.map((t) => t.toJson()).toList());
    await prefs.setString('tasks', encoded);
  }

  Future<void> addTask(Task task) async {
    _tasks.add(task);
    await saveTasks();
  }

  Future<void> removeTask(String id) async {
    _tasks.removeWhere((task) => task.id == id);
    await saveTasks();
  }

  Future<void> updateTask(Task updatedTask) async {
    final index = _tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      await saveTasks();
    }
  }

  Future<void> toggleTaskStatus(String id) async {
    final task = _tasks.firstWhere((task) => task.id == id);
    task.toggleCompleted();
    await saveTasks();
  }
}
