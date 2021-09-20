import 'package:flutter/material.dart';
import 'package:live_session_6/views/user_info_page.dart';
import 'package:live_session_6/views/users_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Http Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UsersPage(),
    );
  }
}