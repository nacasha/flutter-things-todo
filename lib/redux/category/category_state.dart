import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

import 'package:thingstodo/data/model/models.dart';

part 'category_state.g.dart';

abstract class CategoryState implements Built<CategoryState, CategoryStateBuilder> {
  static Serializer<CategoryState> get serializer => _$categoryStateSerializer;

  // state
  BuiltList<CategoryModel> get categories;

  CategoryState._();
  factory CategoryState([updates(CategoryStateBuilder b)]) = _$CategoryState;
}
