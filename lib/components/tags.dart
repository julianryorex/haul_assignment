import 'package:flutter/material.dart';
import 'package:haul_assignment/utilities.dart';

class Tags extends StatelessWidget {
  final String tagString;
  const Tags({Key key, this.tagString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(17)),
          color: HaulColors.orange,
        ),
        child: Center(child: Text('$tagString', style: TextStyle(color: Colors.white, fontSize: 12))),
      ),
    );
  }
}
