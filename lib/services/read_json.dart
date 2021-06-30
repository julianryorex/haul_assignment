import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:haul_assignment/models/workday.dart';

class ReadJson {
  final String fileName;
  Map<String, dynamic> _jsonObj;
  BuiltList<Workday> _workdayList = BuiltList<Workday>();

  ReadJson(this.fileName);

  Map<String, dynamic> getJsonObj() => _jsonObj;

  BuiltList<Workday> getWorkdayList() => _workdayList;

  bool hasNextPage() =>
      _jsonObj.containsKey('pagination') &&
      (_jsonObj['pagination'] as Map<String, dynamic>).containsKey('hasNextPage') &&
      _jsonObj['pagination']['hasNextPage'];

  Future<void> loadJson() async {
    final jsonString = await _getJson(fileName);
    _jsonObj = json.decode(jsonString);
    _workdayList = _convertToWorkdayList(_jsonObj);
  }

  Future<String> _getJson(String fileName) {
    print('Loading json from `$fileName`');
    return rootBundle.loadString(fileName);
  }

  BuiltList<Workday> _convertToWorkdayList(Map<String, dynamic> jsonObj) {
    List<Workday> workdayList = [];

    if (jsonObj.containsKey('data')) {
      final datapoints = jsonObj['data'] as List<dynamic>;
      datapoints.forEach((dp) {
        DateTime startTime, endTime;
        Duration offDutyDuration;

        if ((dp as Map<String, dynamic>).containsKey('startTime')) {
          startTime = DateTime.parse(dp['startTime']);
          // print(startTime);
        }
        if ((dp as Map<String, dynamic>).containsKey('endTime')) {
          endTime = DateTime.parse(dp['endTime']);
          // print(endTime);
        }

        if ((dp as Map<String, dynamic>).containsKey('dutyStatusDurations') &&
            (dp['dutyStatusDurations'] as Map<String, dynamic>).containsKey('offDutyDurationMs')) {
          offDutyDuration = Duration(milliseconds: dp['dutyStatusDurations']['offDutyDurationMs']);
          // print('yes, $offDutyDuration');
        }

        if (startTime != null && endTime != null && offDutyDuration != null) {
          Workday workday = Workday(
            (b) => b
              ..utcStartTime = startTime
              ..utcEndTime = endTime
              ..offDutyDurationMs = offDutyDuration,
          );
          workdayList.add(workday);
        }
      });
    }

    return BuiltList<Workday>(workdayList);
  }
}
