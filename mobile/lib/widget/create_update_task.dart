import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/model/task_model.dart';
import 'package:mobile/provider/task_provider.dart';

class CreateUpdatetask extends ConsumerStatefulWidget {
  CreateUpdatetask({Key? key, this.UpdateComponent = false}) : super(key: key);

  final bool UpdateComponent;

  @override
  ConsumerState<CreateUpdatetask> createState() => _CreateUpdatetaskState();
}

final _formKey = GlobalKey<FormState>();

class _CreateUpdatetaskState extends ConsumerState<CreateUpdatetask> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Új Task létrehoza
  void _createTask() {
    if (_formKey.currentState!.validate()) {
      final newTask = createTaskModel(
        title: titleController.text,
        description: descriptionController.text,
      );

      // Riverpod provider meghívása a feladat létrehozásához
      ref.read(createTaskProvider(newTask).future).then((_) {
        // Az űrlap alaphelyzetbe állítása
        titleController.clear();
        descriptionController.clear();

        //frissítsjük a taskProvidert
        ref.invalidate(taskProvider);
        //visszalépünk
        Navigator.pop(context);
      }).catchError((error) {
        // Hiba esetén visszajelzés
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to create task'),
          ),
        );
      });
    }
  }

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
              const SizedBox(height: 50),
              const Icon(Icons.assignment, size: 140),
              const SizedBox(height: 100),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.45,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: widget.UpdateComponent
                              ? "Update Task Title"
                              : "Task Title",
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        textCapitalization: TextCapitalization.sentences,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        controller: descriptionController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          labelText: widget.UpdateComponent
                              ? "Update task description"
                              : "Task description",
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        style: const TextStyle(color: Colors.white),
                        //telefon billenytűzetén lévő done gomb vezérlése
                        textInputAction: TextInputAction.done,
                        onSubmitted: (value) {
                          _createTask();
                        },
                      ),
                      const SizedBox(height: 30),
                      widget.UpdateComponent
                          ? ElevatedButton(
                              onPressed: () {
                                // Update logika
                              },
                              child: const Text(
                                "Update Task",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: _createTask,
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
