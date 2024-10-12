import 'package:flutter/material.dart';

class StatusColor {
  static final Map<String, Color> statusColors = {
    "pending": Colors.red[400]!, 
    "completed": Colors.green[400]!, 
    "in-progress":
        Colors.blue[400]!, 
  };

 
  static Color getColor(String status) {
    return statusColors[status] ??
        Colors.grey; 
  }
}
