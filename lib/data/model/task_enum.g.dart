// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_enum.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TaskStatus _$active = const TaskStatus._('active');
const TaskStatus _$done = const TaskStatus._('done');
const TaskStatus _$later = const TaskStatus._('later');

TaskStatus _$statusValueOf(String name) {
  switch (name) {
    case 'active':
      return _$active;
    case 'done':
      return _$done;
    case 'later':
      return _$later;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<TaskStatus> _$statusValues =
    new BuiltSet<TaskStatus>(const <TaskStatus>[
  _$active,
  _$done,
  _$later,
]);

const TaskPriority _$p1 = const TaskPriority._('p1');
const TaskPriority _$p2 = const TaskPriority._('p2');
const TaskPriority _$p3 = const TaskPriority._('p3');
const TaskPriority _$p4 = const TaskPriority._('p4');

TaskPriority _$priorityValueOf(String name) {
  switch (name) {
    case 'p1':
      return _$p1;
    case 'p2':
      return _$p2;
    case 'p3':
      return _$p3;
    case 'p4':
      return _$p4;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<TaskPriority> _$priorityValues =
    new BuiltSet<TaskPriority>(const <TaskPriority>[
  _$p1,
  _$p2,
  _$p3,
  _$p4,
]);

Serializer<TaskStatus> _$taskStatusSerializer = new _$TaskStatusSerializer();
Serializer<TaskPriority> _$taskPrioritySerializer =
    new _$TaskPrioritySerializer();

class _$TaskStatusSerializer implements PrimitiveSerializer<TaskStatus> {
  @override
  final Iterable<Type> types = const <Type>[TaskStatus];
  @override
  final String wireName = 'TaskStatus';

  @override
  Object serialize(Serializers serializers, TaskStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  TaskStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TaskStatus.valueOf(serialized as String);
}

class _$TaskPrioritySerializer implements PrimitiveSerializer<TaskPriority> {
  @override
  final Iterable<Type> types = const <Type>[TaskPriority];
  @override
  final String wireName = 'TaskPriority';

  @override
  Object serialize(Serializers serializers, TaskPriority object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  TaskPriority deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TaskPriority.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
