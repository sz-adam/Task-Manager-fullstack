import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart'; // Dátum formázásához
import 'package:mobile/model/status_color_model.dart';
import 'package:mobile/model/task_model.dart';
import 'package:mobile/widget/create_update_task.dart';
import 'package:mobile/widget/slidable_delete_dialog.dart';
import 'package:mobile/widget/status_bottom_dialog.dart';

class Task extends StatefulWidget {
  const Task({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  //status modosítása
  void _openStatusUpdate(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => StatusBottomDialog(task: widget.task));
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMd().format(widget.task.createdAt);

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
                  return SlidableDeleteDialog(id: widget.task.id);
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
          //status
          SlidableAction(
            onPressed: _openStatusUpdate,
            icon: Icons.update,
            backgroundColor: Colors.green,
          ),
          //update
          SlidableAction(
            onPressed: (context) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreateUpdatetask(
                      updateComponent: true, task: widget.task),
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
        color: StatusColor.getColor(widget.task.status),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.task.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(widget.task.description),
            ],
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$formattedDate',
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
              const SizedBox(height: 18),
              Text(
                widget.task.status,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
