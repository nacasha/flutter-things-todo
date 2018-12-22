import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'calendar_state.g.dart';

const String defaultValue = 'defaultValue';

abstract class CalendarState implements Built<CalendarState, CalendarStateBuilder> {
  static Serializer<CalendarState> get serializer => _$calendarStateSerializer;

  @defaultValue
  DateTime get date;

  @nullable
  DateTime get selectedDate;

  CalendarState._();
  factory CalendarState([updates(CalendarStateBuilder b)]) = _$CalendarState;
}
