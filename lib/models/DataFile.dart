import 'package:flutter/material.dart';
import 'task.dart';

class Data extends ChangeNotifier {
  List<Task> _task = [
    Task(name: 'Task 1'),
    Task(name: 'Task 2'),
    Task(name: 'Task 3'),
    Task(name: 'Task 4'),
    Task(name: 'Task 5'),
    Task(name: 'Task 6'),
    Task(name: 'Task 7'),
  ];

  List<Task> get task => _task;
  int done = 0;
  int pends = 0;
  int get taskLength => _task.length;
  int get pending => taskLength;

  void addToList(String title) {
    _task.add(Task(name: title));
    notifyListeners();
  }

  void boxed(int index) {
    _task.elementAt(index).clickedBox();
    // counter(_task.elementAt(index).isDone);
    notifyListeners();
  }

  String name(int index) {
    return _task.elementAt(index).name;
  }

  bool isChecked(int index) {
    bool checker = _task.elementAt(index).isDone;
    return checker;
  }

  dynamic deleteTask(int index) {
    _task.removeAt(index);
    notifyListeners();
  }

  void initializer() {
    done = 0;
    pends = 0;
    for (int i = 0; i < pending; i++) {
      if (_task.elementAt(i).isDone == true) {
        done++;
      } else {
        pends++;
      }
    }
    notifyListeners();
  }
}
