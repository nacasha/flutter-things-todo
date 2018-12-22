// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CalendarState> _$calendarStateSerializer =
    new _$CalendarStateSerializer();

class _$CalendarStateSerializer implements StructuredSerializer<CalendarState> {
  @override
  final Iterable<Type> types = const [CalendarState, _$CalendarState];
  @override
  final String wireName = 'CalendarState';

  @override
  Iterable serialize(Serializers serializers, CalendarState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.date != null) {
      result
        ..add('date')
        ..add(serializers.serialize(object.date,
            specifiedType: const FullType(DateTime)));
    }
    if (object.selectedDate != null) {
      result
        ..add('selectedDate')
        ..add(serializers.serialize(object.selectedDate,
            specifiedType: const FullType(DateTime)));
    }

    return result;
  }

  @override
  CalendarState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CalendarStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'selectedDate':
          result.selectedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$CalendarState extends CalendarState {
  @override
  final DateTime date;
  @override
  final DateTime selectedDate;

  factory _$CalendarState([void updates(CalendarStateBuilder b)]) =>
      (new CalendarStateBuilder()..update(updates)).build();

  _$CalendarState._({this.date, this.selectedDate}) : super._();

  @override
  CalendarState rebuild(void updates(CalendarStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CalendarStateBuilder toBuilder() => new CalendarStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CalendarState &&
        date == other.date &&
        selectedDate == other.selectedDate;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, date.hashCode), selectedDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CalendarState')
          ..add('date', date)
          ..add('selectedDate', selectedDate))
        .toString();
  }
}

class CalendarStateBuilder
    implements Builder<CalendarState, CalendarStateBuilder> {
  _$CalendarState _$v;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  DateTime _selectedDate;
  DateTime get selectedDate => _$this._selectedDate;
  set selectedDate(DateTime selectedDate) =>
      _$this._selectedDate = selectedDate;

  CalendarStateBuilder();

  CalendarStateBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _selectedDate = _$v.selectedDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CalendarState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CalendarState;
  }

  @override
  void update(void updates(CalendarStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CalendarState build() {
    final _$result =
        _$v ?? new _$CalendarState._(date: date, selectedDate: selectedDate);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
