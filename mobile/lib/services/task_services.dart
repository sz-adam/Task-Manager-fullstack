import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/model/task_model.dart';

class TaskServices {
  final String _baseUrl = 'http://10.0.2.2:3000/api/';

//összes task
  Future<List<TaskModel>> fetchAllTask() async {
    final response = await http.post(Uri.parse('${_baseUrl}alltasks'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((task) => TaskModel.fromJson(task)).toList();
    } else {
      throw Exception('Failed to load Tasks');
    }
  }

// create Task
  Future<void> createTask(createTaskModel task) async {
    final response = await http.post(Uri.parse('${_baseUrl}tasks'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(task.toJson()));
    if (response.statusCode != 201) {
      throw Exception("Failed to create task");
    }
  }

// Task törlése ID alapján
  Future<void> deleteTask(int taskId) async {
    final response = await http.delete(
      Uri.parse('${_baseUrl}deletetask/$taskId'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete Task');
    }
  }

  //update Task
  Future<void> updateTask(TaskModel task) async {
    final response = await http.put(
      Uri.parse('${_baseUrl}updatetasks/${task.id}'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(task.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update task');
    }
  }
}
