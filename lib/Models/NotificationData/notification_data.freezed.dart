// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) {
  return _NotificationData.fromJson(json);
}

/// @nodoc
mixin _$NotificationData {
  int get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  bool get isOn => throw _privateConstructorUsedError;
  List<int> get weekDaysId => throw _privateConstructorUsedError;
  List<bool> get weekDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDataCopyWith<NotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDataCopyWith<$Res> {
  factory $NotificationDataCopyWith(
          NotificationData value, $Res Function(NotificationData) then) =
      _$NotificationDataCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String date,
      bool isOn,
      List<int> weekDaysId,
      List<bool> weekDays});
}

/// @nodoc
class _$NotificationDataCopyWithImpl<$Res>
    implements $NotificationDataCopyWith<$Res> {
  _$NotificationDataCopyWithImpl(this._value, this._then);

  final NotificationData _value;
  // ignore: unused_field
  final $Res Function(NotificationData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? isOn = freezed,
    Object? weekDaysId = freezed,
    Object? weekDays = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      isOn: isOn == freezed
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
      weekDaysId: weekDaysId == freezed
          ? _value.weekDaysId
          : weekDaysId // ignore: cast_nullable_to_non_nullable
              as List<int>,
      weekDays: weekDays == freezed
          ? _value.weekDays
          : weekDays // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc
abstract class _$$_NotificationDataCopyWith<$Res>
    implements $NotificationDataCopyWith<$Res> {
  factory _$$_NotificationDataCopyWith(
          _$_NotificationData value, $Res Function(_$_NotificationData) then) =
      __$$_NotificationDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String date,
      bool isOn,
      List<int> weekDaysId,
      List<bool> weekDays});
}

/// @nodoc
class __$$_NotificationDataCopyWithImpl<$Res>
    extends _$NotificationDataCopyWithImpl<$Res>
    implements _$$_NotificationDataCopyWith<$Res> {
  __$$_NotificationDataCopyWithImpl(
      _$_NotificationData _value, $Res Function(_$_NotificationData) _then)
      : super(_value, (v) => _then(v as _$_NotificationData));

  @override
  _$_NotificationData get _value => super._value as _$_NotificationData;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? isOn = freezed,
    Object? weekDaysId = freezed,
    Object? weekDays = freezed,
  }) {
    return _then(_$_NotificationData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      isOn: isOn == freezed
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
      weekDaysId: weekDaysId == freezed
          ? _value._weekDaysId
          : weekDaysId // ignore: cast_nullable_to_non_nullable
              as List<int>,
      weekDays: weekDays == freezed
          ? _value._weekDays
          : weekDays // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationData
    with DiagnosticableTreeMixin
    implements _NotificationData {
  _$_NotificationData(
      {this.id = 1,
      this.date = "",
      this.isOn = true,
      final List<int> weekDaysId = const [],
      final List<bool> weekDays = const [
        true,
        true,
        true,
        true,
        true,
        true,
        true
      ]})
      : _weekDaysId = weekDaysId,
        _weekDays = weekDays;

  factory _$_NotificationData.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationDataFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final bool isOn;
  final List<int> _weekDaysId;
  @override
  @JsonKey()
  List<int> get weekDaysId {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekDaysId);
  }

  final List<bool> _weekDays;
  @override
  @JsonKey()
  List<bool> get weekDays {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekDays);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationData(id: $id, date: $date, isOn: $isOn, weekDaysId: $weekDaysId, weekDays: $weekDays)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('isOn', isOn))
      ..add(DiagnosticsProperty('weekDaysId', weekDaysId))
      ..add(DiagnosticsProperty('weekDays', weekDays));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.isOn, isOn) &&
            const DeepCollectionEquality()
                .equals(other._weekDaysId, _weekDaysId) &&
            const DeepCollectionEquality().equals(other._weekDays, _weekDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(isOn),
      const DeepCollectionEquality().hash(_weekDaysId),
      const DeepCollectionEquality().hash(_weekDays));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationDataCopyWith<_$_NotificationData> get copyWith =>
      __$$_NotificationDataCopyWithImpl<_$_NotificationData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationDataToJson(
      this,
    );
  }
}

abstract class _NotificationData implements NotificationData {
  factory _NotificationData(
      {final int id,
      final String date,
      final bool isOn,
      final List<int> weekDaysId,
      final List<bool> weekDays}) = _$_NotificationData;

  factory _NotificationData.fromJson(Map<String, dynamic> json) =
      _$_NotificationData.fromJson;

  @override
  int get id;
  @override
  String get date;
  @override
  bool get isOn;
  @override
  List<int> get weekDaysId;
  @override
  List<bool> get weekDays;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationDataCopyWith<_$_NotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}
