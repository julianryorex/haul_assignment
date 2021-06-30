import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HaulColors {
  static var orange = Color(0xFFD86E41);
}

DateTime parseDate(DateTime date) => DateFormat("yyyy-MM-dd HH:mm:sssZ").parseUTC(date.toString()).toLocal();

String formatDate(DateTime date) => DateFormat.yMd().format(date).toString();

double hoursWorked(DateTime startTime, DateTime endTime, {Duration offDuty}) {
  final parsedStartDate = parseDate(startTime);
  final parsedEndDate = parseDate(endTime);
  final difference = parsedEndDate.difference(parsedStartDate);
  return (difference.inHours - offDuty.inHours).toDouble();
}
