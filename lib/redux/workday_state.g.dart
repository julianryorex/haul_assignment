// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workday_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkdayState extends WorkdayState {
  @override
  final BuiltList<Workday> workdayList;

  factory _$WorkdayState([void Function(WorkdayStateBuilder) updates]) =>
      (new WorkdayStateBuilder()..update(updates)).build();

  _$WorkdayState._({this.workdayList}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        workdayList, 'WorkdayState', 'workdayList');
  }

  @override
  WorkdayState rebuild(void Function(WorkdayStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkdayStateBuilder toBuilder() => new WorkdayStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkdayState && workdayList == other.workdayList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, workdayList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WorkdayState')
          ..add('workdayList', workdayList))
        .toString();
  }
}

class WorkdayStateBuilder
    implements Builder<WorkdayState, WorkdayStateBuilder> {
  _$WorkdayState _$v;

  ListBuilder<Workday> _workdayList;
  ListBuilder<Workday> get workdayList =>
      _$this._workdayList ??= new ListBuilder<Workday>();
  set workdayList(ListBuilder<Workday> workdayList) =>
      _$this._workdayList = workdayList;

  WorkdayStateBuilder();

  WorkdayStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workdayList = $v.workdayList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkdayState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkdayState;
  }

  @override
  void update(void Function(WorkdayStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WorkdayState build() {
    _$WorkdayState _$result;
    try {
      _$result = _$v ?? new _$WorkdayState._(workdayList: workdayList.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'workdayList';
        workdayList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'WorkdayState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
