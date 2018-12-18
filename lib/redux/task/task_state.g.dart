// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaskState> _$taskStateSerializer = new _$TaskStateSerializer();

class _$TaskStateSerializer implements StructuredSerializer<TaskState> {
  @override
  final Iterable<Type> types = const [TaskState, _$TaskState];
  @override
  final String wireName = 'TaskState';

  @override
  Iterable serialize(Serializers serializers, TaskState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'tasks',
      serializers.serialize(object.tasks,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TaskModel)])),
    ];

    return result;
  }

  @override
  TaskState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'tasks':
          result.tasks.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(TaskModel)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$TaskState extends TaskState {
  @override
  final BuiltList<TaskModel> tasks;

  factory _$TaskState([void updates(TaskStateBuilder b)]) =>
      (new TaskStateBuilder()..update(updates)).build();

  _$TaskState._({this.tasks}) : super._() {
    if (tasks == null) {
      throw new BuiltValueNullFieldError('TaskState', 'tasks');
    }
  }

  @override
  TaskState rebuild(void updates(TaskStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskStateBuilder toBuilder() => new TaskStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskState && tasks == other.tasks;
  }

  @override
  int get hashCode {
    return $jf($jc(0, tasks.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TaskState')..add('tasks', tasks))
        .toString();
  }
}

class TaskStateBuilder implements Builder<TaskState, TaskStateBuilder> {
  _$TaskState _$v;

  ListBuilder<TaskModel> _tasks;
  ListBuilder<TaskModel> get tasks =>
      _$this._tasks ??= new ListBuilder<TaskModel>();
  set tasks(ListBuilder<TaskModel> tasks) => _$this._tasks = tasks;

  TaskStateBuilder();

  TaskStateBuilder get _$this {
    if (_$v != null) {
      _tasks = _$v.tasks?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TaskState;
  }

  @override
  void update(void updates(TaskStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TaskState build() {
    _$TaskState _$result;
    try {
      _$result = _$v ?? new _$TaskState._(tasks: tasks.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tasks';
        tasks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TaskState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
