import 'package:flutter/material.dart';
import 'package:flutter_todo_project/pages/todo_file.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter TO DO Project...",
      home: TodoFile(),
    );
  }
}