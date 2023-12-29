import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class Comp1 extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTodo;

  Comp1({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTodo,
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: "Delete",
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 17, 66, 95),
          ),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                fillColor: MaterialStateProperty.all<Color>(
                  Colors.white,
                ),
                checkColor: Colors.black,
                value: taskCompleted,
                onChanged: onChanged,
              ),
              const SizedBox(
                  width: 8), // Adding some space between Checkbox and Text
              Expanded(
                child: Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    decoration: (taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
