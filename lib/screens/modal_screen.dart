import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/DataFile.dart';

class ModalScreen extends StatefulWidget {
  @override
  State<ModalScreen> createState() => _ModalScreenState();
}

class _ModalScreenState extends State<ModalScreen> {
  var taskTitle;
  @override
  Widget build(BuildContext context) {
    var methods = Provider.of<Data>(context);
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
            ),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              decoration: InputDecoration(hintText: 'Add Your Task Here'),
              onChanged: (value) {
                taskTitle = value;
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            MaterialButton(
                onPressed: () {
                  setState(() {
                    methods.addToList(taskTitle);
                    Navigator.pop(context);
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.lightBlueAccent),
                      child: Center(
                        child: Text(
                          'Add',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
