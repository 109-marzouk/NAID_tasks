import 'package:flutter/material.dart';

import 'grid_view_card.dart';

class Task3 extends StatefulWidget {
  const Task3({Key? key}) : super(key: key);

  @override
  _Task3State createState() => _Task3State();
}

class _Task3State extends State<Task3> {

  List<GridViewCard> gridViewCardItems = [
    const GridViewCard(
        imagPath: "assets/imgs/t3_1.png",
        title: "Employee Management",
        subTitle: "Shared by cathy34"
    ),
    const GridViewCard(
        imagPath: "assets/imgs/t3_2.png",
        title: "Recruitment Management",
        subTitle: "Shared by tony"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 300,
          padding: const EdgeInsets.all(25.0),
          color: Colors.grey.shade100,
          child: ListView.builder(
            itemExtent: 350,
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) {
              return  Container(
                margin: const EdgeInsets.all(15),
                child: gridViewCardItems[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
