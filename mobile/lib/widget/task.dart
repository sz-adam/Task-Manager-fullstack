import 'package:flutter/material.dart';
import 'package:mobile/Dummy_data.dart';

class Task extends StatelessWidget {
  const Task({Key? key, required this.task}) : super(key: key);

  final TaskData task;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(task.title),
    );
  }
}
