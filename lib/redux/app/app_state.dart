import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:thingstodo/redux/task/task_state.dart';
import 'package:thingstodo/redux/calendar/calendar_state.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  static Serializer<AppState> get serializer => _$appStateSerializer;

  TaskState get task;
  CalendarState get calendar;

  AppState._();
  factory AppState([updates(AppStateBuilder b)]) = _$AppState;

  static filterPersistedState(_$AppState state) => (
    state.rebuild((b) => b
      ..calendar = CalendarStateBuilder()
      // ..task = TaskState().toBuilder()
    )
  );
}
