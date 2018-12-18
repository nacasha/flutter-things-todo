import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'task_enum.g.dart';

class TaskStatus extends EnumClass {
  static Serializer<TaskStatus> get serializer => _$taskStatusSerializer;

  static const TaskStatus active = _$active;
  static const TaskStatus done = _$done;
  static const TaskStatus later = _$later;

  const TaskStatus._(String name) : super(name);

  static BuiltSet<TaskStatus> get values => _$statusValues;
  static TaskStatus valueOf(String name) => _$statusValueOf(name);
}

class TaskPriority extends EnumClass {
  static Serializer<TaskPriority> get serializer => _$taskPrioritySerializer;

  static const TaskPriority p1 = _$p1;
  static const TaskPriority p2 = _$p2;
  static const TaskPriority p3 = _$p3;
  static const TaskPriority p4 = _$p4;

  const TaskPriority._(String name) : super(name);

  static BuiltSet<TaskPriority> get values => _$priorityValues;
  static TaskPriority valueOf(String name) => _$priorityValueOf(name);
}
