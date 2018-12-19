import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:thingstodo/redux/task/task_state.dart';

part 'app_state.g.dart';

/// [AppState] combine all states from all redux into one
abstract class AppState implements Built<AppState, AppStateBuilder> {
  static Serializer<AppState> get serializer => _$appStateSerializer;

  // State
  TaskState get task;

  /// [AppState] factory set all states to default value
  AppState._();
  factory AppState([updates(AppStateBuilder b)]) = _$AppState;

  static filterPersistedState(_$AppState state) => (
    state.rebuild((b) => b
      // ..task = TaskState().toBuilder()
    )
  );
}
