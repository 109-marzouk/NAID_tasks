import 'package:flutter/material.dart';
import 'package:live_session_5/get_started_page.dart';
import 'package:live_session_5/login_page.dart';
import 'package:live_session_5/user_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool getStartedClicked = false;
bool isLoggedIn = false;
String? userEmail;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  getStartedClicked = prefs.getBool('getStartedClicked') ?? false;
  isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  userEmail = prefs.getString('email');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page Navigation Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: getStartedClicked ?
      (isLoggedIn ? UserHomePage(email: userEmail!,) :  const LoginPage())
          : const GetStartedPage(),
    );
  }
}
