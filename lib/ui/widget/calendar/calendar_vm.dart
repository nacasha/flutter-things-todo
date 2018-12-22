import 'package:redux/redux.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/redux/calendar/calendar_actions.dart';

class CalendarVM {
  final DateTime date;
  final DateTime selectedDate;

  final Function setNextWeek;
  final Function setPreviousWeek;
  final Function setNextMonth;
  final Function setPreviousMonth;
  final Function updateSelectedDate;

  CalendarVM({
    @required this.date,
    @required this.selectedDate,
    @required this.setNextWeek,
    @required this.setPreviousWeek,
    @required this.setNextMonth,
    @required this.setPreviousMonth,
    @required this.updateSelectedDate,
  });

  static CalendarVM fromStore(Store<AppState> store) {
    final state = store.state;
    final dispatch = store.dispatch;

    return CalendarVM(
      date: state.calendar.date.toLocal(),
      selectedDate: state.calendar.selectedDate.toLocal(),
      setNextWeek: () {
        dispatch(SetNextWeekAction());
      },
      setPreviousWeek: () {
        dispatch(SetPreviousWeekAction());
      },
      setNextMonth: () {
        dispatch(SetNextMonthAction());
      },
      setPreviousMonth: () {
        dispatch(SetPreviousMonthAction());
      },
      updateSelectedDate: (date) {
        dispatch(UpdateSelectedDateAction(date: date));
      },
    );
  }
}
