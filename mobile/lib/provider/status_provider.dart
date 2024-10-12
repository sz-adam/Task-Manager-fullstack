import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/provider/task_provider.dart';
import 'package:mobile/services/status_services.dart';

final apiStatusProvider = Provider((ref) => StatusServices());

final statusProvider = FutureProvider<List<String>>((ref) async {
  final apiStatusAll = ref.watch(apiStatusProvider);
  return apiStatusAll.allStatus();
});


final updateStatus =
    FutureProvider.family<void, Map<String, dynamic>>((ref, data) async {
  final updateStatusService = ref.read(apiStatusProvider);

  final taskId = data['taskId'] as int;
  final status = data['status'] as String;

  await updateStatusService.updateStatus(taskId, status);
   ref.invalidate(taskProvider);
});
