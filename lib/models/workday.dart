import 'package:built_value/built_value.dart';

part 'workday.g.dart';

abstract class Workday implements Built<Workday, WorkdayBuilder> {
  Workday._();
  factory Workday([void Function(WorkdayBuilder) updates]) = _$Workday;

  DateTime get utcStartTime;

  DateTime get utcEndTime;

  Duration get offDutyDurationMs;
}
