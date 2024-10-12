import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/model/status_color_model.dart';
import 'package:mobile/provider/task_provider.dart';

class TaskChart extends ConsumerWidget {
  const TaskChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTaskAsyncValue = ref.watch(taskProvider);
    return SizedBox(
      width: 250,
      height: 250,
      child: allTaskAsyncValue.when(
        data: (tasks) {
          // Statuszok hossza
          int completed =
              tasks.where((task) => task.status == 'completed').length;
          int pending = tasks.where((task) => task.status == 'pending').length;
          int inProgress =
              tasks.where((task) => task.status == 'in-progress').length;

          int total = tasks.length;

          // Statuszok % kiszámítása
          double completedPercent = (completed / total) * 100;
          double pendingPercent = (pending / total) * 100;
          double inProgressPercent = (inProgress / total) * 100;

          const style = TextStyle(fontWeight: FontWeight.w500);

          return Container(
            margin: const EdgeInsets.all(8),
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  titleSunbeamLayout: false,
                  sections: [
                    PieChartSectionData(
                      value: completedPercent,
                      color: StatusColor.getColor('completed'),
                      title: '${completedPercent.toStringAsFixed(1)}%',
                      titleStyle: style,
                    ),
                    PieChartSectionData(
                      value: pendingPercent,
                      color: StatusColor.getColor('pending'),
                      title: '${pendingPercent.toStringAsFixed(1)}%',
                      titleStyle: style,
                    ),
                    PieChartSectionData(
                      value: inProgressPercent,
                      color: StatusColor.getColor('in-progress'),
                      title: '${inProgressPercent.toStringAsFixed(1)}%',
                      titleStyle: style,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
