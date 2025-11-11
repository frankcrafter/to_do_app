import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final DismissDirectionCallback onDismissed;
  final Function(bool?)? onChanged;
  const Task({
    super.key,
    required this.taskName,
    required this.isCompleted,
    required this.onDismissed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(15, 15, 15, 0),
      child: Dismissible(
        key: Key(taskName),
        direction: DismissDirection.endToStart,
        onDismissed: onDismissed,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF1E1E1E)),
            color: Colors.black,
            borderRadius: BorderRadiusDirectional.circular(5),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(10, 15, 40, 15),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    side: BorderSide(color: Colors.white, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(4),
                    ),
                    activeColor: Colors.transparent,
                    checkColor: Colors.white,
                    value: isCompleted,
                    onChanged: onChanged,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    taskName.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white.withOpacity(isCompleted ? 0.7 : 1.0),
                      fontSize: 16,
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: Colors.grey[400],
                      decorationThickness: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
