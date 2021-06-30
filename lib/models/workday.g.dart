// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workday.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Workday extends Workday {
  @override
  final DateTime utcStartTime;
  @override
  final DateTime utcEndTime;
  @override
  final Duration offDutyDurationMs;

  factory _$Workday([void Function(WorkdayBuilder) updates]) =>
      (new WorkdayBuilder()..update(updates)).build();

  _$Workday._({this.utcStartTime, this.utcEndTime, this.offDutyDurationMs})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        utcStartTime, 'Workday', 'utcStartTime');
    BuiltValueNullFieldError.checkNotNull(utcEndTime, 'Workday', 'utcEndTime');
    BuiltValueNullFieldError.checkNotNull(
        offDutyDurationMs, 'Workday', 'offDutyDurationMs');
  }

  @override
  Workday rebuild(void Function(WorkdayBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkdayBuilder toBuilder() => new WorkdayBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Workday &&
        utcStartTime == other.utcStartTime &&
        utcEndTime == other.utcEndTime &&
        offDutyDurationMs == other.offDutyDurationMs;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, utcStartTime.hashCode), utcEndTime.hashCode),
        offDutyDurationMs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Workday')
          ..add('utcStartTime', utcStartTime)
          ..add('utcEndTime', utcEndTime)
          ..add('offDutyDurationMs', offDutyDurationMs))
        .toString();
  }
}

class WorkdayBuilder implements Builder<Workday, WorkdayBuilder> {
  _$Workday _$v;

  DateTime _utcStartTime;
  DateTime get utcStartTime => _$this._utcStartTime;
  set utcStartTime(DateTime utcStartTime) =>
      _$this._utcStartTime = utcStartTime;

  DateTime _utcEndTime;
  DateTime get utcEndTime => _$this._utcEndTime;
  set utcEndTime(DateTime utcEndTime) => _$this._utcEndTime = utcEndTime;

  Duration _offDutyDurationMs;
  Duration get offDutyDurationMs => _$this._offDutyDurationMs;
  set offDutyDurationMs(Duration offDutyDurationMs) =>
      _$this._offDutyDurationMs = offDutyDurationMs;

  WorkdayBuilder();

  WorkdayBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _utcStartTime = $v.utcStartTime;
      _utcEndTime = $v.utcEndTime;
      _offDutyDurationMs = $v.offDutyDurationMs;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Workday other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Workday;
  }

  @override
  void update(void Function(WorkdayBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Workday build() {
    final _$result = _$v ??
        new _$Workday._(
            utcStartTime: BuiltValueNullFieldError.checkNotNull(
                utcStartTime, 'Workday', 'utcStartTime'),
            utcEndTime: BuiltValueNullFieldError.checkNotNull(
                utcEndTime, 'Workday', 'utcEndTime'),
            offDutyDurationMs: BuiltValueNullFieldError.checkNotNull(
                offDutyDurationMs, 'Workday', 'offDutyDurationMs'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
