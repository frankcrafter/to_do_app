import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/utilities/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  int currentIndex = 0;

  List taskList = [
    ['code new app', true],
    ['get groceries', false],
    ['go to the gym', false],
    ['do homerwork', true],
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

  // enter new task
  void enterNewTask() {
    setState(() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return DialogBox(controller: _controller, onSave: saveNewTask);
        },
      );
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text("T O D O  A P P"),
        elevation: 0,
      ),
      floatingActionButton: SizedBox(
        height: 50,
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
      body: ListView.builder(
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
    );
  }
}
