import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  bool isChecked;
  final String title;
  final checkBoxCallBack;
  final longPress;

  TaskTile(
      {required this.isChecked,
      required this.title,
      this.checkBoxCallBack,
      this.longPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPress,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkBoxCallBack,
      ),
    );
  }
}
