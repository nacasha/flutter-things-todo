import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

import 'models.dart';

part 'task_model.g.dart';

abstract class TaskModel implements Built<TaskModel, TaskModelBuilder> {
  static Serializer<TaskModel> get serializer => _$taskModelSerializer;

  /// [State]
  String get taskId;
  String get title;
  String get description;
  String get category;
  bool get important;
  TaskStatus get status;
  TaskPriority get priority;
  DateTime get date;

  TaskModel._();
  factory TaskModel([updates(TaskModelBuilder b)]) = _$TaskModel;
}
