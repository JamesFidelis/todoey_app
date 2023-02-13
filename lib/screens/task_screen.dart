import 'package:flutter/material.dart';
import 'package:todoey_app/models/DataFile.dart';
import '../widgets/task_list.dart';
import 'modal_screen.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    var methods = Provider.of<Data>(context);
    try {
      methods.initializer();
    } catch (e) {
      print(e);
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 20.0,
        ),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => ModalScreen());
        },
        elevation: 10.0,
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30.0, 60.0, 60.0, 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  radius: 30.0,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'To Do List',
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text(
                  'You have ${methods.taskLength} Tasks',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  '${methods.done} Done',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  '${methods.pends} Pending',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 15.0),
                child: TaskList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
