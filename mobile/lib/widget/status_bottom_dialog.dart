import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/model/task_model.dart';
import 'package:mobile/provider/status_provider.dart';
import 'package:mobile/widget/status.dart';

class StatusBottomDialog extends ConsumerStatefulWidget {
  const StatusBottomDialog({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  _StatusBottomDialogState createState() => _StatusBottomDialogState();
}

class _StatusBottomDialogState extends ConsumerState<StatusBottomDialog> {
  String? selectedStatus;

  void _updateStatus() async {
    try {
      await ref.read(updateStatus({
        'taskId': widget.task.id,
        'status': selectedStatus,
      }).future);
      Navigator.pop(context);
    } catch (e) {
      print('Hiba történt: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskAsyncValue = ref.watch(statusProvider);

    return taskAsyncValue.when(
      data: (status) {
        if (selectedStatus == null && status.isNotEmpty) {
          selectedStatus = widget.task.status;
        }
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Status Update',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: status.length,
                  itemBuilder: (context, index) {
                    final stat = status[index];
                    return Status(
                      status: stat,
                      selectedStatus: selectedStatus,
                      onSelected: (value) {
                        setState(() {
                          selectedStatus = value;
                        });
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _updateStatus,
                child: const Text(
                  'Submit Status',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
