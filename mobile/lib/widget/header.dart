import 'package:flutter/material.dart';
import 'package:mobile/widget/create_update_task.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Task Manager", style: Theme.of(context).textTheme.titleLarge),
          IconButton(
            icon:const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreateUpdatetask(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
