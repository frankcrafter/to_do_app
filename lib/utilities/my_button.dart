import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnName;
  final VoidCallback onPressed;
  const MyButton({super.key, required this.btnName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(5),
          ),
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.grey[300],
        ),
        onPressed: onPressed,
        child: Text(
          btnName,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
