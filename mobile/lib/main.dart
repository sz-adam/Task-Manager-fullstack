import 'package:flutter/material.dart';
import 'package:mobile/page/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child:MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: const Color.fromARGB(255, 0, 82, 122),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 0, 82, 122),
            foregroundColor: Colors.white,
          ), //háttérszin
          textTheme: const TextTheme(
              //Cím stilusa
              titleLarge: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              //Task cím stílusa
              titleMedium: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),

              //Task leírás stílusa
              labelMedium: TextStyle(color: Colors.white)),
          iconTheme: const IconThemeData(
            size: 30,
            color: Colors.white,
          )),
      home: HomePage(),
    );
  }
}
