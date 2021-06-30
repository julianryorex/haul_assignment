import 'package:flutter/material.dart';
import 'package:haul_assignment/utilities.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _renderTextButton(context, summaryType: 'Daily'),
          _renderTextButton(context, summaryType: 'Weekly'),
        ],
      ),
    );
  }

  Widget _renderTextButton(BuildContext context, {@required String summaryType}) {
    final screenPath = summaryType == 'Daily' ? '/daily' : '/weekly';

    final textColor = ModalRoute.of(context).settings.name == screenPath ? HaulColors.orange : Colors.black;

    return TextButton(
      onPressed: () => Navigator.pushReplacementNamed(context, screenPath),
      child: Text(
        '$summaryType Summary',
        style: TextStyle(color: textColor),
      ),
    );
  }
}
