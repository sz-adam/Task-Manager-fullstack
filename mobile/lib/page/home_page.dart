import 'package:flutter/material.dart';
import 'package:mobile/widget/header.dart';
import 'package:mobile/widget/task_chart.dart';
import 'package:mobile/widget/task_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Header(),
          const TaskChart(),
          Expanded(
            child: TaskListPage(),
          ),
        ],
      )),
    );
  }
}
