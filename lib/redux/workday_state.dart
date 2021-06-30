import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:haul_assignment/models/workday.dart';

part 'workday_state.g.dart';

abstract class WorkdayState implements Built<WorkdayState, WorkdayStateBuilder> {
  WorkdayState._();
  factory WorkdayState([void Function(WorkdayStateBuilder) updates]) = _$WorkdayState;

  BuiltList<Workday> get workdayList;
}
