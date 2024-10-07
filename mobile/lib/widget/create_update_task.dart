import 'package:flutter/material.dart';

class CreateUpdatetask extends StatefulWidget {
  CreateUpdatetask({Key? key, this.UpdateComponent = false}) : super(key: key);

  final bool UpdateComponent;

  @override
  State<CreateUpdatetask> createState() => _CreateUpdatetaskState();
}

final _formKey = GlobalKey<FormState>();

class _CreateUpdatetaskState extends State<CreateUpdatetask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.UpdateComponent ? "Update Task" : "Create Task"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.assignment,
                size: 140,
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.45,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: widget.UpdateComponent
                              ? "Update Task Title"
                              : "Task Title",
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: widget.UpdateComponent
                              ? "Update task description"
                              : "Task description ",
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      widget.UpdateComponent
                          ? ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Update Task",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Add Task",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
