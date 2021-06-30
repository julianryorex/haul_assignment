import 'package:flutter/material.dart';
import 'package:haul_assignment/models/workday.dart';
import 'package:haul_assignment/services/payroll.dart';
import 'package:haul_assignment/utilities.dart';

class DailyPay extends StatelessWidget {
  final Workday workday;
  const DailyPay({Key key, this.workday}) : super(key: key);

  double _calculateDailyPay() {
    final parsedStartDate = parseDate(workday.utcStartTime);
    final parsedEndDate = parseDate(workday.utcEndTime);
    final difference = parsedEndDate.difference(parsedStartDate);
    final totalMinutes = (difference.inMinutes - workday.offDutyDurationMs.inMinutes).toDouble();

    return Payroll().getNetPay(totalMinutes);
  }

  @override
  Widget build(BuildContext context) {
    final dailyPay = _calculateDailyPay();
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        child: Text(
          '\$${dailyPay.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 30, color: HaulColors.orange),
        ),
      ),
    );
  }
}
