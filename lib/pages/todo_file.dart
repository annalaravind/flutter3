import 'package:flutter/material.dart';
import 'package:flutter_todo_project/components/comp1container.dart';
import 'package:flutter_todo_project/components/dialog_1.dart';

void main() {
  runApp(const TodoFile());
}

class TodoFile extends StatefulWidget {
  const TodoFile({super.key});

  @override
  State<TodoFile> createState() => _TodoFileState();
}

class _TodoFileState extends State<TodoFile> {
  List taskNamesList = [
    ["Flutter Project1..", false],
    ["Flutter Project2..", false],
    ["Flutter Project3..", false],
    ["Flutter Project4..", false],
    ["Flutter Project5..", false],
  ];

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog1();
      },
    );
  }

  void checkBoxFunction(bool? value, int index) {
    setState(() {
      taskNamesList[index][1] = !taskNamesList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],

      // Drawer....
      drawer: Drawer(
        elevation: 16.0,
        backgroundColor: Colors.purple[100],
        child: const Column(
          children: [
            DrawerHeader(
              child: Text(
                "This is Drawer Header..",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),

      // App bar....
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        toolbarHeight: 90,
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 5,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "..TO DO..",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),

      // Body....
      body: ListView.builder(
        itemCount: taskNamesList.length,
        itemBuilder: (context, index) {
          return (Comp1(
            taskName: taskNamesList[index][0],
            taskCompleted: taskNamesList[index][1],
            onChanged: (value) => checkBoxFunction(value, index),
          ));
        },
      ),

      // Floating Button to add Task....
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        shape: const CircleBorder(),
        backgroundColor: Colors.purple[400],
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
