import 'package:flutter/material.dart';
import 'package:mobile/Dummy_data.dart';
import 'package:mobile/widget/task.dart';

class TaskListPage extends StatelessWidget {
  final List<TaskData> tasks = dummyTasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Task(task: task);
        },
      ),
    );
  }
}
