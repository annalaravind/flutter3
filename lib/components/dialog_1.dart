import 'package:flutter/material.dart';

void main() {
  runApp(const Dialog1());
}

class Dialog1 extends StatelessWidget {
  const Dialog1({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[300],
      shadowColor: Colors.black,
      elevation: 5,
      content: const SizedBox(
        height: 200,
        child: Column(
          children: [
            TextField(
              // autofocus: true,

              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      shape: const BorderDirectional(bottom: BorderSide.none),
    );
  }
}
