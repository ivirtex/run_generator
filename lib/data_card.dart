import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  DataCard({this.main, this.second});

  final String main;
  final String second;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          main,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        Text(
          second,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
