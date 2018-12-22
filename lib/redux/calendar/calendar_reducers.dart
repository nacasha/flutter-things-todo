import 'package:redux/redux.dart';

import 'calendar_actions.dart';
import 'calendar_state.dart';

final calendarReducers = combineReducers<CalendarState>([
  TypedReducer<CalendarState, CaledarInitialStateAction>(calendarInitialState),
  TypedReducer<CalendarState, SetNextWeekAction>(setNextWeekAction),
  TypedReducer<CalendarState, SetPreviousWeekAction>(setPreviousWeekAction),
  TypedReducer<CalendarState, SetNextMonthAction>(setNextMonthAction),
  TypedReducer<CalendarState, SetPreviousMonthAction>(setPreviousMonthAction),
  TypedReducer<CalendarState, SetCalendarAction>(setCalendarAction),
  TypedReducer<CalendarState, UpdateSelectedDateAction>(updateSelectedDateAction),
]);

CalendarState calendarInitialState(CalendarState state, CaledarInitialStateAction action) {
  return state.rebuild((b) => b
    ..date = DateTime.now().toUtc()
    ..selectedDate = DateTime.now().toUtc()
  );
}

CalendarState setNextWeekAction(CalendarState state, SetNextWeekAction action) {
  return state.rebuild((b) => b
    ..date = state.date.add(Duration(days: 7))
  );
}

CalendarState setPreviousWeekAction(CalendarState state, SetPreviousWeekAction action) {
  return state.rebuild((b) => b
    ..date = state.date.subtract(Duration(days: 7))
  );
}

CalendarState setNextMonthAction(CalendarState state, SetNextMonthAction action) {
  DateTime old = state.date;

  return state.rebuild((b) => b
    ..date = DateTime(old.year, old.month + 1).toUtc()
  );
}

CalendarState setPreviousMonthAction(CalendarState state, SetPreviousMonthAction action) {
  DateTime old = state.date;

  return state.rebuild((b) => b
    ..date = DateTime(old.year, old.month - 1).toUtc()
  );
}

CalendarState setCalendarAction(CalendarState state, SetCalendarAction action) {
  return state.rebuild((b) => b
    ..date = action.date.toUtc()
  );
}

CalendarState updateSelectedDateAction(CalendarState state, UpdateSelectedDateAction action) {
  return state.rebuild((b) => b
    ..selectedDate = action.date.toUtc()
  );
}
