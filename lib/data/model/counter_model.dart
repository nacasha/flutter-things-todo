import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'counter_model.g.dart';

abstract class CounterModel implements Built<CounterModel, CounterModelBuilder> {
  static Serializer<CounterModel> get serializer => _$counterModelSerializer;

  /// [State]
  int get count;
  int get click;
  BuiltList<String> get counterHistory;

  CounterModel._();
  factory CounterModel([updates(CounterModelBuilder b)]) = _$CounterModel;
}
