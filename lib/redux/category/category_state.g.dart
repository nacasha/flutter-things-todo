// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoryState> _$categoryStateSerializer =
    new _$CategoryStateSerializer();

class _$CategoryStateSerializer implements StructuredSerializer<CategoryState> {
  @override
  final Iterable<Type> types = const [CategoryState, _$CategoryState];
  @override
  final String wireName = 'CategoryState';

  @override
  Iterable serialize(Serializers serializers, CategoryState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'categories',
      serializers.serialize(object.categories,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CategoryModel)])),
    ];

    return result;
  }

  @override
  CategoryState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CategoryModel)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$CategoryState extends CategoryState {
  @override
  final BuiltList<CategoryModel> categories;

  factory _$CategoryState([void updates(CategoryStateBuilder b)]) =>
      (new CategoryStateBuilder()..update(updates)).build();

  _$CategoryState._({this.categories}) : super._() {
    if (categories == null) {
      throw new BuiltValueNullFieldError('CategoryState', 'categories');
    }
  }

  @override
  CategoryState rebuild(void updates(CategoryStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryStateBuilder toBuilder() => new CategoryStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryState && categories == other.categories;
  }

  @override
  int get hashCode {
    return $jf($jc(0, categories.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CategoryState')
          ..add('categories', categories))
        .toString();
  }
}

class CategoryStateBuilder
    implements Builder<CategoryState, CategoryStateBuilder> {
  _$CategoryState _$v;

  ListBuilder<CategoryModel> _categories;
  ListBuilder<CategoryModel> get categories =>
      _$this._categories ??= new ListBuilder<CategoryModel>();
  set categories(ListBuilder<CategoryModel> categories) =>
      _$this._categories = categories;

  CategoryStateBuilder();

  CategoryStateBuilder get _$this {
    if (_$v != null) {
      _categories = _$v.categories?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CategoryState;
  }

  @override
  void update(void updates(CategoryStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CategoryState build() {
    _$CategoryState _$result;
    try {
      _$result = _$v ?? new _$CategoryState._(categories: categories.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'categories';
        categories.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CategoryState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
