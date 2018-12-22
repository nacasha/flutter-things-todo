import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

import 'package:thingstodo/data/persistor.dart';
import 'package:thingstodo/redux/app/app_state.dart';

import 'package:thingstodo/middleware/persistor_middleware.dart';
import 'package:thingstodo/middleware/startup_middleware.dart';
import 'package:thingstodo/middleware/calendar_middleware.dart';

List<Middleware<AppState>> middleware = []
  ..add(LoggingMiddleware.printer())
  ..add(PersistorMiddleware())
  ..add(StartupMiddleware());
