// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'task',
      serializers.serialize(object.task,
          specifiedType: const FullType(TaskState)),
      'calendar',
      serializers.serialize(object.calendar,
          specifiedType: const FullType(CalendarState)),
    ];

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'task':
          result.task.replace(serializers.deserialize(value,
              specifiedType: const FullType(TaskState)) as TaskState);
          break;
        case 'calendar':
          result.calendar.replace(serializers.deserialize(value,
              specifiedType: const FullType(CalendarState)) as CalendarState);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final TaskState task;
  @override
  final CalendarState calendar;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.task, this.calendar}) : super._() {
    if (task == null) {
      throw new BuiltValueNullFieldError('AppState', 'task');
    }
    if (calendar == null) {
      throw new BuiltValueNullFieldError('AppState', 'calendar');
    }
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        task == other.task &&
        calendar == other.calendar;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, task.hashCode), calendar.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('task', task)
          ..add('calendar', calendar))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  TaskStateBuilder _task;
  TaskStateBuilder get task => _$this._task ??= new TaskStateBuilder();
  set task(TaskStateBuilder task) => _$this._task = task;

  CalendarStateBuilder _calendar;
  CalendarStateBuilder get calendar =>
      _$this._calendar ??= new CalendarStateBuilder();
  set calendar(CalendarStateBuilder calendar) => _$this._calendar = calendar;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _task = _$v.task?.toBuilder();
      _calendar = _$v.calendar?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(task: task.build(), calendar: calendar.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'task';
        task.build();
        _$failedField = 'calendar';
        calendar.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
