import 'package:flutter/material.dart';
import 'package:todo_app/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final String? Function(String?)? validator;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(10, 0, 10, 70),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AlertDialog(),
          Text(
            "New Task",
            style: TextStyle(
              color: Colors.grey[500],
              letterSpacing: 1,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 270,
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: controller,
                    cursorColor: Colors.grey[500],
                    style: TextStyle(color: Colors.grey[300]),
                    cursorHeight: 20,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 0),
                      border: OutlineInputBorder(),
                      hintText: "Enter New Task",
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.redAccent[200]!,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.grey[900]!,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.grey[800]!,
                        ),
                      ),
                    ),
                    validator: validator,
                  ),
                ),
              ),
              MyButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    onSave;
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
