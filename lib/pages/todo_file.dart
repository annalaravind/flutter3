import 'package:flutter/material.dart';
import 'package:flutter_todo/components/comp1container.dart';
import 'package:flutter_todo/components/dialog_1.dart';
import 'package:flutter_todo/data/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

void showNotification(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void main() {
  runApp(const TodoFile());
}

class TodoFile extends StatefulWidget {
  const TodoFile({super.key});

  @override
  State<TodoFile> createState() => _TodoFileState();
}

class _TodoFileState extends State<TodoFile> {
  final myContainer = Hive.box("mybox");

  final myController = TextEditingController();
  TododDatabase todo = TododDatabase();

  void onSaveTodo() {
    if (myController.text == "") {
      showNotification("Please enter the task...");
    } else {
      setState(() {
        todo.taskNamesList.add([myController.text, false]);
      });
      Navigator.pop(context);
      myController.text = "";
    }
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog1(
          controller: myController,
          onSave: onSaveTodo,
          onClose: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void checkBoxFunction(bool? value, int index) {
    setState(() {
      todo.taskNamesList[index][1] = !todo.taskNamesList[index][1];
    });
  }

  void deleteFunction(int index) {
    setState(() {
      todo.taskNamesList.removeAt(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    if (myContainer.get("ToDoList") == null) {
      todo.initialView();
    } else {
      todo.updateDatabase();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(todo.taskNamesList.length.toString());

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
        itemCount: todo.taskNamesList.length,
        itemBuilder: (context, index) {
          return (Comp1(
            taskName: todo.taskNamesList[index][0],
            taskCompleted: todo.taskNamesList[index][1],
            onChanged: (value) => checkBoxFunction(value, index),
            deleteTodo: (p0) {
              deleteFunction(index);
            },
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
