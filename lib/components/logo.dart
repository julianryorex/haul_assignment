import 'package:flutter/material.dart';
import 'package:haul_assignment/utilities.dart';

class HaulLogo extends StatelessWidget {
  const HaulLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: HaulColors.orange,
      ),
      child: Center(
        child: Text(
          'H',
          style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
