import 'package:redux/redux.dart';

import 'package:thingstodo/redux/app/app_state.dart';

import 'persistor.dart';

List<Middleware<AppState>> middleware = []
  ..add(persistor.createMiddleware());
