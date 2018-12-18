import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import '../redux/app/app_state.dart';
import '../util/serializers.dart';

final persistor = Persistor(
  storage: FlutterStorage("thingstodo-source"),
  transforms: Transforms(
    onSave: [
      (state) => (
        serializers.serialize(
          AppState.filterStateForSave(state)
        )
      )
    ]
  ),
  decoder: (dynamic json) => serializers.deserialize(json)
);
