import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/model/task_model.dart';

class SearchService {
  final String _baseUrl = 'http://10.0.2.2:3000/api/searchtasks';

  Future<List<TaskModel>> searchTasks(String title) async {
    final url = Uri.parse('$_baseUrl?title=$title');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // JSON dekódolása
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((task) => TaskModel.fromJson(task)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}
