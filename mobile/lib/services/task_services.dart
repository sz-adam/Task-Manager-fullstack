import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/model/task_model.dart';

class TaskServices {
  Future<List<TaskModel>> fetchAllTask() async {
    final response =
        await http.post(Uri.parse("http://10.0.2.2:3000/api/alltasks"));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((task) => TaskModel.fromJson(task)).toList();
    } else {
      throw Exception('Failed to load Tasks');
    }
  }
}
