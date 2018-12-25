import 'package:redux/redux.dart';

import 'package:thingstodo/redux/app/app_state.dart';

class CalendarMiddleware extends MiddlewareClass<AppState>{
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);
  }
}
