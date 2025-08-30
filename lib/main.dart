import 'package:flutter/material.dart';
import 'pages/task_list_page.dart';
import 'services/task_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final taskService = TaskService();
  await taskService.loadTasks();

  runApp(TaskFlowApp(taskService: taskService));
}

class TaskFlowApp extends StatelessWidget {
  final TaskService taskService;

  TaskFlowApp({required this.taskService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskFlow',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TaskListPage(taskService: taskService),
    );
  }
}
