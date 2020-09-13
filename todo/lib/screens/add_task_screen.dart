import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final Function addTaskCallback;
  AddTaskScreen(this.addTaskCallback);
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTaskTitle;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.deepPurple),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: TextField(
                controller: controller,
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
                textAlign: TextAlign.center,
                autofocus: true,
              ),
            ),
            FlatButton(
              onPressed: () {
                widget.addTaskCallback(newTaskTitle);
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.deepPurpleAccent,
            ),
          ],
        ),
      ),
    );
  }
}
