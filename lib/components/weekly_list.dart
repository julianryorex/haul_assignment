import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:haul_assignment/components/tags.dart';
import 'package:haul_assignment/models/workday.dart';
import 'package:haul_assignment/redux/workday_state.dart';
import 'package:haul_assignment/services/payroll.dart';
import 'package:haul_assignment/utilities.dart';

class WeeklyList extends StatefulWidget {
  const WeeklyList({Key key}) : super(key: key);

  @override
  _WeeklyListState createState() => _WeeklyListState();
}

class _WeeklyListState extends State<WeeklyList> {
  bool isFirst;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<WorkdayState, BuiltList<Workday>>(
      converter: (store) => store.state.workdayList,
      builder: (context, BuiltList<Workday> workdayList) {
        return ListView.separated(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          separatorBuilder: (context, index) {
            if (index < workdayList.length) {
              if (workdayList[index].utcStartTime.weekday == 5 && index < workdayList.length) {
                return WeeklySeparator(workdayList: workdayList, index: index + 1);
              }
            }

            return Container(height: 10);
          },
          itemCount: workdayList.length,
          itemBuilder: (BuildContext context, int index) => WeeklyListItem(workday: workdayList[index]),
        );
      },
    );
  }
}

class WeeklySeparator extends StatelessWidget {
  final BuiltList<Workday> workdayList;
  final int index;

  const WeeklySeparator({Key key, this.workdayList, this.index}) : super(key: key);

  double _calculateTotalWeekHours() {
    double totalMinutes = 0.0;
    for (int i = index; i < index + 6; i++) {
      if (i == workdayList.length - 1) break;
      Duration difference = workdayList[i].utcEndTime.difference(workdayList[i].utcStartTime);
      totalMinutes += (difference.inMinutes - workdayList[i].offDutyDurationMs.inMinutes);
    }

    return totalMinutes;
  }

  @override
  Widget build(BuildContext context) {
    final totalMinutes = _calculateTotalWeekHours();

    final lastIndex = index + 6 > workdayList.length ? workdayList.length - 1 : index + 6;

    final parsedStartDate = parseDate(workdayList[index].utcStartTime);
    final parsedEndDate = parseDate(workdayList[lastIndex].utcStartTime);
    final finalStartTime = formatDate(parsedStartDate);
    final finalEndTime = formatDate(parsedEndDate);

    return Container(
      height: 90,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.08,
          color: Colors.white,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '$finalStartTime - $finalEndTime',
                  style: TextStyle(color: HaulColors.orange, fontSize: 16),
                ),
                PayTag(pay: Payroll().getNetPay(totalMinutes)),
                HoursTag(minutes: totalMinutes),
                ComplianceTag(hours: Duration(minutes: totalMinutes.toInt()).inHours),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WeeklyListItem extends StatelessWidget {
  final Workday workday;

  WeeklyListItem({Key key, this.workday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parsedStartDate = parseDate(workday.utcStartTime);
    final parsedEndDate = parseDate(workday.utcEndTime);
    final difference = parsedEndDate.difference(parsedStartDate);
    final totalMinutes = (difference.inMinutes - workday.offDutyDurationMs.inMinutes).toDouble();

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/focus', arguments: workday),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.06,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _renderDates(),
                PayTag(pay: Payroll().getNetPay(totalMinutes)),
                HoursTag(minutes: totalMinutes),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderDates() {
    final parsedStartDate = parseDate(workday.utcStartTime);
    String finalTime = formatDate(parsedStartDate);
    return Text('$finalTime', style: TextStyle(color: HaulColors.orange, fontSize: 16));
  }
}
