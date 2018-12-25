// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaskModel> _$taskModelSerializer = new _$TaskModelSerializer();

class _$TaskModelSerializer implements StructuredSerializer<TaskModel> {
  @override
  final Iterable<Type> types = const [TaskModel, _$TaskModel];
  @override
  final String wireName = 'TaskModel';

  @override
  Iterable serialize(Serializers serializers, TaskModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'taskId',
      serializers.serialize(object.taskId,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'categoryId',
      serializers.serialize(object.categoryId,
          specifiedType: const FullType(String)),
      'important',
      serializers.serialize(object.important,
          specifiedType: const FullType(bool)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(TaskStatus)),
      'priority',
      serializers.serialize(object.priority,
          specifiedType: const FullType(TaskPriority)),
      'date',
      serializers.serialize(object.date,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  TaskModel deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'taskId':
          result.taskId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categoryId':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'important':
          result.important = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(TaskStatus)) as TaskStatus;
          break;
        case 'priority':
          result.priority = serializers.deserialize(value,
              specifiedType: const FullType(TaskPriority)) as TaskPriority;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$TaskModel extends TaskModel {
  @override
  final String taskId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String categoryId;
  @override
  final bool important;
  @override
  final TaskStatus status;
  @override
  final TaskPriority priority;
  @override
  final DateTime date;

  factory _$TaskModel([void updates(TaskModelBuilder b)]) =>
      (new TaskModelBuilder()..update(updates)).build();

  _$TaskModel._(
      {this.taskId,
      this.title,
      this.description,
      this.categoryId,
      this.important,
      this.status,
      this.priority,
      this.date})
      : super._() {
    if (taskId == null) {
      throw new BuiltValueNullFieldError('TaskModel', 'taskId');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('TaskModel', 'title');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('TaskModel', 'description');
    }
    if (categoryId == null) {
      throw new BuiltValueNullFieldError('TaskModel', 'categoryId');
    }
    if (important == null) {
      throw new BuiltValueNullFieldError('TaskModel', 'important');
    }
    if (status == null) {
      throw new BuiltValueNullFieldError('TaskModel', 'status');
    }
    if (priority == null) {
      throw new BuiltValueNullFieldError('TaskModel', 'priority');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('TaskModel', 'date');
    }
  }

  @override
  TaskModel rebuild(void updates(TaskModelBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskModelBuilder toBuilder() => new TaskModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskModel &&
        taskId == other.taskId &&
        title == other.title &&
        description == other.description &&
        categoryId == other.categoryId &&
        important == other.important &&
        status == other.status &&
        priority == other.priority &&
        date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, taskId.hashCode), title.hashCode),
                            description.hashCode),
                        categoryId.hashCode),
                    important.hashCode),
                status.hashCode),
            priority.hashCode),
        date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TaskModel')
          ..add('taskId', taskId)
          ..add('title', title)
          ..add('description', description)
          ..add('categoryId', categoryId)
          ..add('important', important)
          ..add('status', status)
          ..add('priority', priority)
          ..add('date', date))
        .toString();
  }
}

class TaskModelBuilder implements Builder<TaskModel, TaskModelBuilder> {
  _$TaskModel _$v;

  String _taskId;
  String get taskId => _$this._taskId;
  set taskId(String taskId) => _$this._taskId = taskId;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _categoryId;
  String get categoryId => _$this._categoryId;
  set categoryId(String categoryId) => _$this._categoryId = categoryId;

  bool _important;
  bool get important => _$this._important;
  set important(bool important) => _$this._important = important;

  TaskStatus _status;
  TaskStatus get status => _$this._status;
  set status(TaskStatus status) => _$this._status = status;

  TaskPriority _priority;
  TaskPriority get priority => _$this._priority;
  set priority(TaskPriority priority) => _$this._priority = priority;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  TaskModelBuilder();

  TaskModelBuilder get _$this {
    if (_$v != null) {
      _taskId = _$v.taskId;
      _title = _$v.title;
      _description = _$v.description;
      _categoryId = _$v.categoryId;
      _important = _$v.important;
      _status = _$v.status;
      _priority = _$v.priority;
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TaskModel;
  }

  @override
  void update(void updates(TaskModelBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TaskModel build() {
    final _$result = _$v ??
        new _$TaskModel._(
            taskId: taskId,
            title: title,
            description: description,
            categoryId: categoryId,
            important: important,
            status: status,
            priority: priority,
            date: date);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
