import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/model/task_model.dart';
import 'package:mobile/services/task_services.dart';

final apiServiceProvider = Provider((ref) => TaskServices());

final taskProvider = FutureProvider<List<TaskModel>>((ref) async {
  final apiTaskService = ref.watch(apiServiceProvider);
  return apiTaskService.fetchAllTask();
});
