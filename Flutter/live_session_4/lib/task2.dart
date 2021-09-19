import 'package:flutter/material.dart';

import 'grid_view_card.dart';

class Task2 extends StatefulWidget {
  const Task2({Key? key}) : super(key: key);

  @override
  _Task2State createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          padding: const EdgeInsets.all(25.0),
          color: Colors.grey.shade100,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 1,
            crossAxisSpacing: 30.0,
            mainAxisSpacing: 30.0,
            childAspectRatio: 1.5,
            children: const [
              GridViewCard(
                  imagPath: "assets/imgs/t2_1.png",
                  title: "Logistics Management",
                  subTitle: "Created in tony's workspace"
              ),
              GridViewCard(
                  imagPath: "assets/imgs/t2_2.png",
                  title: "Order Management",
                  subTitle: "Created Mar 14, 2018"
              ),
            ],
          ),
        ),
      ),
    );
  }
}
