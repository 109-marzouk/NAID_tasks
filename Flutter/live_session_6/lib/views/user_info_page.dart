import 'package:flutter/material.dart';
import 'package:live_session_6/controllers/user.dart';

class UserInfoPage extends StatefulWidget {
  final User? user;
  const UserInfoPage({Key? key, required this.user}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {

  List<TableRow> userInfoRows(){
    List<TableRow> result = [
       const TableRow(
           children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Key',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
             Padding(
               padding: EdgeInsets.all(8.0),
               child: Text(
                 'Value',
                 style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 18
                 ),
               ),
             ),
        ]
       ),
    ];
    widget.user?.toMap().forEach((key, value) {
      result.addAll([
          TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(key),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: value is Address ?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Street:\n${value.street}\n"),
                          Text("Suite:\n${value.suite}\n"),
                          Text("City:\n${value.city}\n"),
                          Text("Zip Code:\n${value.zipCode}\n"),
                          Text("Geo:\n${value.geo.lat}, ${value.geo.lng}"),
                        ],
                      )
                      : value is Company ?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name:\n${value.name}\n"),
                          Text("Catch Phrase:\n${value.catchPhrase}\n"),
                          Text("BS:\n${value.bs}\n"),
                        ],
                      )
                      : Text(value.toString()),
                ),
              ])
      ]);
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.user?.name ?? ''),
            Text(
              "@${widget.user?.username}",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Table(
              border: TableBorder.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 2),
              children: userInfoRows()
            ),
          ),
        ],
      ),
    );
  }
}
