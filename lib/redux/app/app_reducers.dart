import 'package:redux_persist/redux_persist.dart';

import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/redux/task/task_reducers.dart';
import 'package:thingstodo/redux/calendar/calendar_reducers.dart';

AppState appReducers(AppState state, dynamic action) {
  if (action is PersistLoadedAction) {
    return action.state ?? state;
  }

  return state.rebuild((b) => b
    ..task.replace(taskReducers(state.task, action))
    ..calendar.replace(calendarReducers(state.calendar, action))
  );
}
