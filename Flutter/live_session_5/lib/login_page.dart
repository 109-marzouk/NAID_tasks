import 'package:flutter/material.dart';
import 'package:live_session_5/user_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController  = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(size: 150,),
              const SizedBox(height: 50,),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: (value) =>
                        value!.isEmpty ? 'Email Number is required' : null,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock)
                        ),
                        validator: (value) =>
                        value!.isEmpty ? 'Password is required' : null,
                        controller: _passController,
                      ),
                      const SizedBox(height: 25,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: const Text('Sign In'),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setBool('isLoggedIn', true);
                              prefs.setString('email', _emailController.text);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserHomePage(email: _emailController.text)
                                  )
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        'Forget password? No yawa. Tap me',
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 40,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
                          ),
                          child: const Text(
                            'No Account? Sign Up',
                            style: TextStyle(color: Colors.black54),
                          ),
                          onPressed: () {
                            // print("Sign Up");
                          },
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}