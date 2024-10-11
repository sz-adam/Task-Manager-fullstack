import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/services/status_services.dart';

final apiStatusProvider = Provider((ref) => StatusServices());

final statusProvider = FutureProvider<List<String>>((ref) async {
  final apiStatusAll = ref.watch(apiStatusProvider);
  return apiStatusAll.allStatus();
});
