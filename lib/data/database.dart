import 'package:hive_flutter/hive_flutter.dart';

class TododDatabase {
  List taskNamesList = [];
  final myContainer = Hive.box("mybox");

  // Initial view....
  void initialView() {
    taskNamesList = [
      ["Flutter Project 1", false],
      ["Flutter Project 2", false]
    ];
  }

  // Update the Data...
  void updateDatabase() {
    myContainer.put("ToDoList", taskNamesList);
  }

  // Getting the Data...
  void gettingData() {
    myContainer.get("ToDoList");
  }
}
