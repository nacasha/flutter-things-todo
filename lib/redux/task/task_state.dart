import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

import 'package:thingstodo/data/model/models.dart';

part 'task_state.g.dart';

abstract class TaskState implements Built<TaskState, TaskStateBuilder> {
  static Serializer<TaskState> get serializer => _$taskStateSerializer;

  // state
  BuiltList<TaskModel> get tasks;

  TaskState._();
  factory TaskState([updates(TaskStateBuilder b)]) = _$TaskState;
}
