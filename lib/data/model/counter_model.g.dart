// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CounterModel> _$counterModelSerializer =
    new _$CounterModelSerializer();

class _$CounterModelSerializer implements StructuredSerializer<CounterModel> {
  @override
  final Iterable<Type> types = const [CounterModel, _$CounterModel];
  @override
  final String wireName = 'CounterModel';

  @override
  Iterable serialize(Serializers serializers, CounterModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
      'click',
      serializers.serialize(object.click, specifiedType: const FullType(int)),
      'counterHistory',
      serializers.serialize(object.counterHistory,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  CounterModel deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CounterModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'click':
          result.click = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'counterHistory':
          result.counterHistory.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$CounterModel extends CounterModel {
  @override
  final int count;
  @override
  final int click;
  @override
  final BuiltList<String> counterHistory;

  factory _$CounterModel([void updates(CounterModelBuilder b)]) =>
      (new CounterModelBuilder()..update(updates)).build();

  _$CounterModel._({this.count, this.click, this.counterHistory}) : super._() {
    if (count == null) {
      throw new BuiltValueNullFieldError('CounterModel', 'count');
    }
    if (click == null) {
      throw new BuiltValueNullFieldError('CounterModel', 'click');
    }
    if (counterHistory == null) {
      throw new BuiltValueNullFieldError('CounterModel', 'counterHistory');
    }
  }

  @override
  CounterModel rebuild(void updates(CounterModelBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CounterModelBuilder toBuilder() => new CounterModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CounterModel &&
        count == other.count &&
        click == other.click &&
        counterHistory == other.counterHistory;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, count.hashCode), click.hashCode), counterHistory.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CounterModel')
          ..add('count', count)
          ..add('click', click)
          ..add('counterHistory', counterHistory))
        .toString();
  }
}

class CounterModelBuilder
    implements Builder<CounterModel, CounterModelBuilder> {
  _$CounterModel _$v;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  int _click;
  int get click => _$this._click;
  set click(int click) => _$this._click = click;

  ListBuilder<String> _counterHistory;
  ListBuilder<String> get counterHistory =>
      _$this._counterHistory ??= new ListBuilder<String>();
  set counterHistory(ListBuilder<String> counterHistory) =>
      _$this._counterHistory = counterHistory;

  CounterModelBuilder();

  CounterModelBuilder get _$this {
    if (_$v != null) {
      _count = _$v.count;
      _click = _$v.click;
      _counterHistory = _$v.counterHistory?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CounterModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CounterModel;
  }

  @override
  void update(void updates(CounterModelBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CounterModel build() {
    _$CounterModel _$result;
    try {
      _$result = _$v ??
          new _$CounterModel._(
              count: count,
              click: click,
              counterHistory: counterHistory.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'counterHistory';
        counterHistory.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CounterModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
