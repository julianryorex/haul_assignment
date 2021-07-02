import 'package:flutter/material.dart';
import 'package:haul_assignment/utilities.dart';

import '../presentation/haul_icons_icons.dart';

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
      child: Center(child: Icon(HaulIcons.haul, color: Colors.white, size: 60)),
    );
  }
}
