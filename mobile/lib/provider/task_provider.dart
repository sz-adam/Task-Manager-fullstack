import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/model/task_model.dart';
import 'package:mobile/services/task_services.dart';

final apiServiceProvider = Provider((ref) => TaskServices());

final taskProvider = FutureProvider<List<TaskModel>>((ref) async {
  final apiTaskService = ref.watch(apiServiceProvider);
  return apiTaskService.fetchAllTask();
});

final createTaskProvider =
    FutureProvider.family<void, createTaskModel>((ref, task) async {
  final apiTaskService = ref.watch(apiServiceProvider);
  await apiTaskService.createTask(task);
});

final deleteTaskProvider =
    FutureProvider.family<void, int>((ref, taskId) async {
  final taskService = ref.read(apiServiceProvider);
  await taskService.deleteTask(taskId);
  ref.invalidate(taskProvider); // Frissíti a task listát a törlés után
});

final updateTaskProvider =
    FutureProvider.family<void, TaskModel>((ref, task) async {
  final updateService = ref.read(apiServiceProvider);
  await updateService.updateTask(task);
  ref.invalidate(taskProvider);
});
