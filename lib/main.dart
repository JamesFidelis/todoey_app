import 'package:flutter/material.dart';
import 'models/DataFile.dart';
import 'screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Data(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
