import 'dart:convert';
import 'package:http/http.dart' as http;

class StatusServices {
  Future<List<String>> allStatus() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2:3000/api/allstatus"));

    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load Status');
    }
  }

  Future<void> updateStatus(int taskId, String status) async {
    final response = await http.put(
      Uri.parse("http://10.0.2.2:3000/api/updatestatus/$taskId"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"status": status}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update task');
    }
  }
}
