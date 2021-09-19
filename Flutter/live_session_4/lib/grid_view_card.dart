import 'package:flutter/material.dart';

class GridViewCard extends StatelessWidget {
  final String imagPath;
  final String title;
  final String subTitle;

  const GridViewCard({
    Key? key,
    required this.imagPath,
    required this.title,
    required this.subTitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 100,
              child: Image.asset(imagPath)
          ),
          const SizedBox(height: 20,),
          Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            subTitle,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
