import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'package:thingstodo/redux/app/app_state.dart';

import '../redux/app/app_state.dart';
import '../util/serializers.dart';

final persistor = Persistor(
  storage: FlutterStorage("thingstodo-source"),
  transforms: Transforms(
    onSave: [
      (state) => serializers.serialize(
        AppState.filterPersistedState(state)
      )
    ],
    onLoad: [
      (state) => AppState.filterPersistedState(state)
    ]
  ),
  decoder: (dynamic json) => serializers.deserialize(json)
);
