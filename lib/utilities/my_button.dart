import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnName;
  final VoidCallback onPressed;
  const MyButton({super.key, required this.btnName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.white10),
            borderRadius: BorderRadiusGeometry.circular(3),
          ),
          backgroundColor: Colors.grey[300],
          foregroundColor: Colors.black,
        ),
        onPressed: onPressed,
        child: Text(
          btnName,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
        ),
      ),
    );
  }
}
