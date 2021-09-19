import 'package:flutter/material.dart';
import 'package:live_session_4/task1.dart';
import 'package:live_session_4/task2.dart';
import 'package:live_session_4/task3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page Layout Exercises',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Task1(),
    );
  }
}

