import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;
  const MyButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[300],
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Colors.grey[850]!),
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}
