import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/provider/search_provider.dart';
import 'package:mobile/provider/task_provider.dart';
import 'package:mobile/widget/task.dart';

class TaskListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskAsyncValue = ref.watch(taskProvider);
    final searchResult = ref.watch(searchProvider);

    return Scaffold(
      body: searchResult.when(
        data: (searchTasks) {
          // A keresési eredmény
          if (searchTasks.isNotEmpty) {
            return ListView.builder(
              itemCount: searchTasks.length,
              itemBuilder: (context, index) {
                final task = searchTasks[index];
                return Task(task: task);
              },
            );
          }

          // Task megjelenítése
          return taskAsyncValue.when(
            data: (tasks) {
              if (tasks.isEmpty) {
                return const Center(
                  child: Text(
                    'No task, please pick one up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Task(task: task);
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => const Center(
              child: Text(
                'Failed to load tasks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => const Center(
          child: Text(
            'Failed to load search results',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
