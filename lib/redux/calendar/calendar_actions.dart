
class CaledarInitialStateAction {}

class SetNextWeekAction {}

class SetPreviousWeekAction {}

class SetNextMonthAction {}

class SetPreviousMonthAction {}

class SetCalendarAction {
  final DateTime date;

  SetCalendarAction({
    this.date
  });
}

class UpdateSelectedDateAction {
  final DateTime date;

  UpdateSelectedDateAction({
    this.date
  });
}

