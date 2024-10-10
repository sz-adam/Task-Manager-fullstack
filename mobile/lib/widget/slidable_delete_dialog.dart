import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/provider/task_provider.dart';

class SlidableDeleteDialog extends ConsumerWidget {
  const SlidableDeleteDialog({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  void _deleteTask(WidgetRef ref, BuildContext context) {
    ref.read(deleteTaskProvider(id).future).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Task deleted"), // Sikeres törlés üzenete
          duration: Duration(seconds: 3),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: ${error.toString()}"), // Hibaüzenet
          duration: const Duration(seconds: 3),
        ),
      );
    }).whenComplete(() {
      Navigator.of(context).pop(); // Bezárja a dialógust
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Delete Task'),
      content: const Text('Are you sure you want to delete this task?'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('No'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              textStyle:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
          onPressed: () {
            _deleteTask(ref, context);
          },
          child: const Text(
            'Yes',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
