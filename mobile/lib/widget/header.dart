import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobile/widget/create_update_task.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Stack(
        children: [      
          Positioned(
            left: 10,
            top: 30,
            child: Text("Task Manager",
                style: Theme.of(context).textTheme.titleLarge),
          ),
          // Keresősáv és a + gomb
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: AnimSearchBar(
                  width: 400,
                  textController: textController,
                  onSubmitted: (value) { },
                  onSuffixTap: () {
                    setState(() {
                      textController.clear(); 
                    });
                  },
                  color: Colors.white,
                  helpText: "Search Text..." ,
                  autoFocus: true,
                  closeSearchOnSuffixTap: true,
                  animationDurationInMilli: 1000,
                  rtl: true,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CreateUpdatetask(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
