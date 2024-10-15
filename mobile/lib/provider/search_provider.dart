import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/model/task_model.dart';
import 'package:mobile/services/search_services.dart';

final searchProvider =
    StateNotifierProvider<SearchNotifier, AsyncValue<List<TaskModel>>>((ref) {
  return SearchNotifier();
});

// Keresés kezelése
class SearchNotifier extends StateNotifier<AsyncValue<List<TaskModel>>> {
  final SearchService _searchService = SearchService();

  // Üres lista beállítása
  SearchNotifier() : super(const AsyncValue.data([]));

  // Keresési folyamat
  Future<void> searchTasks(String title) async {   
    state = const AsyncValue.loading();   
    final tasks = await _searchService.searchTasks(title);   
    state = AsyncValue.data(tasks);
  }
}
