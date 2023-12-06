import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Comp1 extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  Comp1({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.purple[200],
        // border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            fillColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
            // activeColor: Colors.black,
            checkColor: Colors.black,
            value: taskCompleted,
            onChanged: onChanged,
          ),
          Text(
            taskName,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
        ],
      ),
    );
  }
}

bool isCorrect = false;
