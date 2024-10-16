import 'dart:convert';
import 'package:http/http.dart' as http;

class StatusServices {
  final String _baseUrl = 'http://10.0.2.2:3000/api/';

  Future<List<String>> allStatus() async {
    final response = await http.get(Uri.parse('${_baseUrl}allstatus'));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load Status');
    }
  }

  Future<void> updateStatus(int taskId, String status) async {
    final response = await http.put(
      Uri.parse('${_baseUrl}updatestatus/$taskId'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"status": status}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update task');
    }
  }
}
