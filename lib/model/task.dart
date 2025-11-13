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
      padding: EdgeInsetsGeometry.fromLTRB(20, 15, 20, 0),
      child: Dismissible(
        key: Key(taskName),
        direction: DismissDirection.endToStart,
        onDismissed: onDismissed,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[850]!),
            color: Color(0xFF0A0A0A),
            borderRadius: BorderRadiusDirectional.circular(5),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(0, 15, 0, 15),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1,
                  child: Checkbox(
                    side: BorderSide(color: Colors.grey[400]!, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(3),
                    ),
                    activeColor: Colors.transparent,
                    checkColor: Colors.grey[200],
                    value: isCompleted,
                    onChanged: onChanged,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    taskName.toUpperCase(),
                    style: TextStyle(
                      color: Colors.grey[200]!.withOpacity(
                        isCompleted ? 0.7 : 1.0,
                      ),
                      fontSize: 16,
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: Colors.grey[500],
                      decorationThickness: 1.5,
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
