import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/utilities/dialog_box.dart';
import 'package:todo_app/utilities/main_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List taskList = [
    ['code new app', false],
    ['go gym', false],
    ['do homework', true],
    ['do shopping', false],
  ];

  // confirm Checkbox
  void boxChecked(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        taskList.add([_controller.text, false]);
        _controller.clear();
      }
    });
    Navigator.of(context).pop();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  // empty textfield
  String? myValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    saveNewTask();
    return null;
  }

  // enter new task
  void enterNewTask() {
    setState(() {
      showModalBottomSheet(
        context: context,
        backgroundColor: Color(0xFF121212),
        builder: (context) {
          return DialogBox(
            validator: (value) => myValidator(_controller.text),
            controller: _controller,
            onSave: saveNewTask,
          );
        },
      );
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0A0A),
        foregroundColor: Colors.white,
        title: Text("TODO APP", style: TextStyle(letterSpacing: 5)),
        elevation: 0,
      ),
      floatingActionButton: SizedBox(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor: Colors.black,
            foregroundColor: Colors.grey[200],
          ),
          onPressed: enterNewTask,
          child: Text("+  Add Task"),
        ),
      ),
      body: Column(
        children: [
          MainPanel(
            taskLeft: taskList
                .where((taskList) => !taskList[1] == false)
                .length,
            taskAmount: taskList.length,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return Task(
                  taskName: taskList[index][0],
                  isCompleted: taskList[index][1],
                  onDismissed: (direction) {
                    deleteTask(index);
                  },
                  onChanged: (value) => boxChecked(value, index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
