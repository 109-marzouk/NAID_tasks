import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:live_session_6/controllers/user.dart';
import 'package:live_session_6/data/remote/api_services.dart';
import 'package:live_session_6/views/user_info_page.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  List<User>? users;

  @override
  void initState() {
    ApiServices apiServices = ApiServices();
    apiServices.getUsers().then((value){
      setState(() {
        users = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        body: users == null ? const Center(
          child: CircularProgressIndicator(),
        ) : ListView.builder(
          itemCount: users?.length,
          itemBuilder: (context, i){
            return ListTile(
              leading: SizedBox(
                width: 55,
                height: 55,
                child: Avatar(
                  shape: AvatarShape.circle(100),
                  name: users![i].name,
                  textStyle: const TextStyle(
                      fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              title: Text(users![i].name),
              subtitle: Text('@${users![i].username}'),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => UserInfoPage(user: users![i])
                  )
                );
              },
            );
          },
        ),
      ),
    );
  }
}
