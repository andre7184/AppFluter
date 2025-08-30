import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/task_service.dart';
import 'edit_task_page.dart';
import 'add_task_page.dart';

class TaskListPage extends StatefulWidget {
  final TaskService taskService;

  TaskListPage({required this.taskService});

  @override
  TaskListPageState createState() => TaskListPageState();
}

class TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    final tasks = widget.taskService.tasks;

    return Scaffold(
      appBar: AppBar(title: Text('Minhas Tarefas')),
      body: tasks.isEmpty
          ? Center(child: Text('Nenhuma tarefa adicionada ainda.'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final Task task = tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: task.isCompleted,
                        onChanged: (_) {
                          setState(() {
                            widget.taskService.toggleTaskStatus(task.id);
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditTaskPage(
                                task: task,
                                taskService: widget.taskService,
                              ),
                            ),
                          ).then((_) => setState(() {}));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            widget.taskService.removeTask(
                              task.id,
                            ); // ✅ Agora funciona
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AddTaskPage(taskService: widget.taskService),
            ),
          ).then((_) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
