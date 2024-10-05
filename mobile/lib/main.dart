import 'package:flutter/material.dart';
import 'package:mobile/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor:
              const Color.fromARGB(255, 0, 82, 122), //háttérszin
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white), //Title stilusa
          ),
          iconTheme: const IconThemeData(
            size: 30,
            color: Colors.white,
          )),
      home: HomePage(),
    );
  }
}
