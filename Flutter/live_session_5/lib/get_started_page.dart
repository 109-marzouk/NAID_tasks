import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 200,
                        child: Image.asset('assets/imgs/pic.png')
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      'Enjoy a healthy lifestyle',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                        'Lorem ipsum dolor sit amet consectetur adipisicing elit. '
                            'Maxime mollitia, molestiae quas vel sint commodi.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 180,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    color: Colors.teal,
                  ),
                  child: TextButton(
                    child: const Text(
                        "GET STRATED",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                      ),
                    ),
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('getStartedClicked', true);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()
                          )
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
