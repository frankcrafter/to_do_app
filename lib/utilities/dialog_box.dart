import 'package:flutter/material.dart';
import 'package:todo_app/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  const DialogBox({super.key, required this.controller, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color(0xFF121212),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(20, 0, 20, 0),
            child: SizedBox(
              height: 250,
              child: Column(
                children: [
                  AlertDialog(),
                  TextField(
                    controller: controller,
                    style: TextStyle(color: Colors.grey[200]),
                    decoration: InputDecoration(
                      hintText: "Enter New Task",
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.grey[700]!,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.5,
                          color: Colors.grey[800]!,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  MyButton(btnName: "SAVE", onPressed: onSave),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
