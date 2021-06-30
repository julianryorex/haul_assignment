import 'package:haul_assignment/redux/workday_state.dart';
import 'package:redux/redux.dart';

import 'actions.dart';

/// combine all reducers here
Reducer<WorkdayState> combinedReducer = combineReducers<WorkdayState>([
  TypedReducer<WorkdayState, UpdateWorkdayList>(onUpdateWorkdayList),
]);

WorkdayState onUpdateWorkdayList(WorkdayState state, UpdateWorkdayList action) {
  return state.rebuild((b) => b..workdayList = action.workdayList.toBuilder());
}
