import 'package:flutter/material.dart';
import 'package:flutter_todo/components/dialogbuttons.dart';

// ignore: must_be_immutable
class Dialog1 extends StatelessWidget {
  dynamic controller;
  VoidCallback onSave;
  VoidCallback onClose;
  Dialog1({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      backgroundColor: const Color.fromARGB(255, 29, 74, 100),
      shadowColor: Colors.black,
      elevation: 5,
      content: SizedBox(
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                hintText: "Add a new task..",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DialogButton(
                  text: "Save",
                  onPressed: onSave,
                ),
                DialogButton(
                  text: "Cancel",
                  onPressed: onClose,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
