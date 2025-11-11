import 'package:flutter/material.dart';
import 'package:todo_app/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey[850]!),
            borderRadius: BorderRadiusDirectional.circular(5),
          ),
          title: Text(
            "E n t e r  N e w  T a s k",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[200], fontSize: 18),
          ),
          content: Container(
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    style: TextStyle(color: Colors.grey[200], fontSize: 15),
                    controller: controller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[850]!),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[850]!),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(btnName: "Save", onPressed: onSave),
                    const SizedBox(width: 2),
                    MyButton(btnName: "Cancel", onPressed: onCancel),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
