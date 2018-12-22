import 'package:redux/redux.dart';

import 'package:thingstodo/data/persistor.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/redux/persistor/persistor_actions.dart';

class PersistorMiddleware extends MiddlewareClass<AppState>{
  var middleware = persistor.createMiddleware();

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if(action is Persist){
      middleware(store, action, next);
    } else {
      next(action);
    }
  }
}
