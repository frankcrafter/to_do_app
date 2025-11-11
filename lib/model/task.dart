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
      padding: EdgeInsetsGeometry.fromLTRB(20, 20, 20, 0),
      child: Dismissible(
        key: Key(taskName),
        direction: DismissDirection.endToStart,
        onDismissed: onDismissed,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[850]!),
            color: Colors.black,
            borderRadius: BorderRadiusDirectional.circular(4),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(10, 15, 40, 15),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.15,
                  child: Checkbox(
                    side: BorderSide(color: Colors.white, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(2),
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
                      color: Colors.white.withOpacity(isCompleted ? 0.5 : 1.0),
                      fontSize: 15,
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: Colors.white38,
                      decorationThickness: 4,
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
