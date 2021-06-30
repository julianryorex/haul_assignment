import 'package:flutter/material.dart';
import 'package:haul_assignment/utilities.dart';

class Line extends StatelessWidget {
  const Line({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        color: HaulColors.orange,
        height: 0.5,
        width: MediaQuery.of(context).size.width * 0.7,
      ),
    );
  }
}
