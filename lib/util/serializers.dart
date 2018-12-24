import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/redux/task/task_state.dart';
import 'package:thingstodo/redux/category/category_state.dart';
import 'package:thingstodo/redux/calendar/calendar_state.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  /// [Redux]
  AppState,
  TaskState,
  CalendarState,
  CategoryState,

  /// [Model]
  TaskModel,
  CategoryModel,

  /// [Enum]
  TaskStatus,
  DateTime
])

final Serializers serializers = (
  _$serializers.toBuilder()
    ..addPlugin(StandardJsonPlugin())
).build();
