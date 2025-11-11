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

  List taskList = [
    ['code new app', true],
    ['do grocery', false],
    ['go to the gym', true],
    ['do paperwork', false],
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
      showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: Navigator.of(context).pop,
          );
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
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey[850]!),
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
        backgroundColor: Colors.black,
        onPressed: enterNewTask,
        child: Icon(Icons.add, color: Colors.white),
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
