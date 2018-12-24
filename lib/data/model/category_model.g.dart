// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoryModel> _$categoryModelSerializer =
    new _$CategoryModelSerializer();

class _$CategoryModelSerializer implements StructuredSerializer<CategoryModel> {
  @override
  final Iterable<Type> types = const [CategoryModel, _$CategoryModel];
  @override
  final String wireName = 'CategoryModel';

  @override
  Iterable serialize(Serializers serializers, CategoryModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'categoryId',
      serializers.serialize(object.categoryId,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CategoryModel deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'categoryId':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CategoryModel extends CategoryModel {
  @override
  final String categoryId;
  @override
  final String title;

  factory _$CategoryModel([void updates(CategoryModelBuilder b)]) =>
      (new CategoryModelBuilder()..update(updates)).build();

  _$CategoryModel._({this.categoryId, this.title}) : super._() {
    if (categoryId == null) {
      throw new BuiltValueNullFieldError('CategoryModel', 'categoryId');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('CategoryModel', 'title');
    }
  }

  @override
  CategoryModel rebuild(void updates(CategoryModelBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryModelBuilder toBuilder() => new CategoryModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryModel &&
        categoryId == other.categoryId &&
        title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, categoryId.hashCode), title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CategoryModel')
          ..add('categoryId', categoryId)
          ..add('title', title))
        .toString();
  }
}

class CategoryModelBuilder
    implements Builder<CategoryModel, CategoryModelBuilder> {
  _$CategoryModel _$v;

  String _categoryId;
  String get categoryId => _$this._categoryId;
  set categoryId(String categoryId) => _$this._categoryId = categoryId;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  CategoryModelBuilder();

  CategoryModelBuilder get _$this {
    if (_$v != null) {
      _categoryId = _$v.categoryId;
      _title = _$v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CategoryModel;
  }

  @override
  void update(void updates(CategoryModelBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CategoryModel build() {
    final _$result =
        _$v ?? new _$CategoryModel._(categoryId: categoryId, title: title);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
