// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  DialogButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 10, left: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(4),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        color: Colors.purple[400],
        child: Text(
          text,
          style:
              const TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}
