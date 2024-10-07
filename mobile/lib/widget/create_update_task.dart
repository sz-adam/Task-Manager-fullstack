import 'package:flutter/material.dart';

class CreateUpdatetask extends StatefulWidget {
  @override
  State<CreateUpdatetask> createState() => _CreateUpdatetaskState();
}

final _formKey = GlobalKey<FormState>();

class _CreateUpdatetaskState extends State<CreateUpdatetask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Create Task"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                const SizedBox(
                height: 50,
              ),
             const Icon(Icons.assignment,size: 140,),
             const SizedBox(height: 100,),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.45,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Task Title",
                          labelStyle: TextStyle(
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
                      const TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: "Task Title",
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Add Task",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
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
