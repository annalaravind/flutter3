// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/todo_file.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Initialise the box...
  await Hive.initFlutter();

  // Open the box...
  var box = await Hive.openBox("mybox");
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
