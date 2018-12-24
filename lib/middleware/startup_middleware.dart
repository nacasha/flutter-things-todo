import 'package:redux/redux.dart';
import 'package:thingstodo/redux/app/app_state.dart';

import 'package:thingstodo/redux/calendar/calendar_actions.dart';
import 'package:thingstodo/redux/category/category_actions.dart';
import 'package:thingstodo/redux/startup/startup_actions.dart';

class StartupMiddleware extends MiddlewareClass<AppState>{
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
      if(action is StartupAction){
        startupAction(next);
      }

      next(action);
  }

  void startupAction(NextDispatcher next) {
    next(CaledarInitialStateAction());
    next(CategoryInitialStateAction());
  }
}
