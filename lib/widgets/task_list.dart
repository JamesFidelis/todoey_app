import 'package:flutter/material.dart';
import 'package:todoey_app/widgets/task_tile.dart';
import 'package:todoey_app/models/DataFile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, dataFile, child) => ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            title: dataFile.name(index),
            isChecked: dataFile.isChecked(index),
            checkBoxCallBack: (newVal) {
              dataFile.boxed(index);
            },
            longPress: () {
              dataFile.deleteTask(index);
            },
          );
        },
        itemCount: dataFile.taskLength,
      ),
    );
  }
}
