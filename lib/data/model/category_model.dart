import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'category_model.g.dart';

abstract class CategoryModel implements Built<CategoryModel, CategoryModelBuilder> {
  static Serializer<CategoryModel> get serializer => _$categoryModelSerializer;

  /// [State]
  String get categoryId;
  String get title;

  CategoryModel._();
  factory CategoryModel([updates(CategoryModelBuilder b)]) = _$CategoryModel;
}
