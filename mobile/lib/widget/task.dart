import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart'; // Dátum formázásához
import 'package:mobile/model/task_model.dart';
import 'package:mobile/widget/create_update_task.dart';
import 'package:mobile/widget/slidable_delete_dialog.dart';

class Task extends StatelessWidget {
  const Task({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMd().format(task.createdAt);

    return Slidable(
      //starting
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SlidableDeleteDialog(id:task.id);
                },
              );
            },
            icon: Icons.delete,
            backgroundColor: Colors.red,
          ),
        ],
      ),
      //ending
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            icon: Icons.update,
            backgroundColor: Colors.green,
          ),
          SlidableAction(
            onPressed: (context) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreateUpdatetask(updateComponent: true),
                ),
              );
            },
            icon: Icons.edit,
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Lekerekített sarkak
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(task.description),
            ],
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$formattedDate',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 18),
              Text(
                task.status,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
