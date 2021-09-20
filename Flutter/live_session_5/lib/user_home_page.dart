import 'package:flutter/material.dart';
import 'package:live_session_5/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserHomePage extends StatefulWidget {

  final String? email;
  const UserHomePage({Key? key, required this.email}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello ${widget.email!}!'),
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setBool('isLoggedIn', false);
                    prefs.remove('email');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage()
                      )
                    );
                  },
                  child: const Text('Sign out'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
