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

class ComplianceTag extends StatelessWidget {
  final int hours;
  const ComplianceTag({Key key, this.hours}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;
    if (hours < 70 * 0.8) {
      icon = Icons.check;
      color = Colors.green;
    } else if (hours > 70 * 0.8 && hours < 70) {
      icon = Icons.check;
      color = Colors.yellow;
    } else {
      icon = Icons.warning_amber_sharp;
      color = Colors.red;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      child: Icon(icon, color: Colors.white, size: 30),
    );
  }
}

class PayTag extends StatelessWidget {
  final double pay;

  const PayTag({Key key, this.pay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: HaulColors.orange,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
          child: Text(
        '\$${(pay).toStringAsFixed(2)}',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}

class HoursTag extends StatelessWidget {
  final double minutes;
  const HoursTag({Key key, this.minutes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hours = Duration(minutes: minutes.toInt()).inHours;
    return Container(
      width: 60,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.green,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
          child: Text(
        '$hours Hrs',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
