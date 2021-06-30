import 'package:flutter/material.dart';
import 'package:haul_assignment/components/daily_pay.dart';
import 'package:haul_assignment/components/line.dart';
import 'package:haul_assignment/components/logo.dart';
import 'package:haul_assignment/components/tags.dart';
import 'package:haul_assignment/models/workday.dart';
import 'package:haul_assignment/utilities.dart';
import 'package:intl/intl.dart';

class HaulCard extends StatelessWidget {
  final Workday workday;

  const HaulCard({Key key, this.workday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(17)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            _renderDay(),
            HaulLogo(),
            DailyPay(workday: workday),
            Line(),
            _renderTimeTag(workday.utcStartTime, 'Start Time'),
            _renderTimeTag(workday.utcEndTime, 'End Time'),
            _renderOffDutyTime(),
            _renderHoursWorked(),
            _renderRates(),
            Line(),
            // _renderExplanation(context),
          ],
        ),
      ),
    );
  }

  Widget _renderHoursWorked() {
    final totalHours = hoursWorked(workday.utcStartTime, workday.utcEndTime, offDuty: workday.offDutyDurationMs);
    final hoursStr = 'Hours Worked: ${totalHours.toStringAsFixed(0)} hrs';
    return Tags(tagString: '$hoursStr');
  }

  Widget _renderDay() {
    final day = DateFormat('EEEE, d MMMM').format(workday.utcStartTime);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Text('$day', style: TextStyle(color: HaulColors.orange, fontSize: 25)),
      ),
    );
  }

  Widget _renderTimeTag(DateTime time, String title) {
    final formattedTime = DateFormat("yyyy-MM-dd HH:mm:sssZ").parseUTC(time.toString()).toLocal();
    String finalTime = DateFormat.yMd().add_jm().format(formattedTime).toString();

    return Tags(tagString: '$title: $finalTime');
  }

  Widget _renderOffDutyTime() {
    final offDutyTime = 'Off Duty Time: ${workday.offDutyDurationMs.inHours} hrs';
    return Tags(tagString: offDutyTime);
  }

  Widget _renderRates() {
    final ratesString = 'Rate: \$22/hr';
    return Tags(tagString: ratesString);
  }
}
