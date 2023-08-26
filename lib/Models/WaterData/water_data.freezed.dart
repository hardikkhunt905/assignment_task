// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'water_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WaterData _$WaterDataFromJson(Map<String, dynamic> json) {
  return _WaterData.fromJson(json);
}

/// @nodoc
mixin _$WaterData {
  String get date => throw _privateConstructorUsedError;
  int get timeMl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WaterDataCopyWith<WaterData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaterDataCopyWith<$Res> {
  factory $WaterDataCopyWith(WaterData value, $Res Function(WaterData) then) =
      _$WaterDataCopyWithImpl<$Res>;
  $Res call({String date, int timeMl});
}

/// @nodoc
class _$WaterDataCopyWithImpl<$Res> implements $WaterDataCopyWith<$Res> {
  _$WaterDataCopyWithImpl(this._value, this._then);

  final WaterData _value;
  // ignore: unused_field
  final $Res Function(WaterData) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? timeMl = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      timeMl: timeMl == freezed
          ? _value.timeMl
          : timeMl // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_WaterDataCopyWith<$Res> implements $WaterDataCopyWith<$Res> {
  factory _$$_WaterDataCopyWith(
          _$_WaterData value, $Res Function(_$_WaterData) then) =
      __$$_WaterDataCopyWithImpl<$Res>;
  @override
  $Res call({String date, int timeMl});
}

/// @nodoc
class __$$_WaterDataCopyWithImpl<$Res> extends _$WaterDataCopyWithImpl<$Res>
    implements _$$_WaterDataCopyWith<$Res> {
  __$$_WaterDataCopyWithImpl(
      _$_WaterData _value, $Res Function(_$_WaterData) _then)
      : super(_value, (v) => _then(v as _$_WaterData));

  @override
  _$_WaterData get _value => super._value as _$_WaterData;

  @override
  $Res call({
    Object? date = freezed,
    Object? timeMl = freezed,
  }) {
    return _then(_$_WaterData(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      timeMl: timeMl == freezed
          ? _value.timeMl
          : timeMl // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WaterData with DiagnosticableTreeMixin implements _WaterData {
  _$_WaterData({this.date = "", this.timeMl = 0});

  factory _$_WaterData.fromJson(Map<String, dynamic> json) =>
      _$$_WaterDataFromJson(json);

  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final int timeMl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WaterData(date: $date, timeMl: $timeMl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WaterData'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('timeMl', timeMl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WaterData &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.timeMl, timeMl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(timeMl));

  @JsonKey(ignore: true)
  @override
  _$$_WaterDataCopyWith<_$_WaterData> get copyWith =>
      __$$_WaterDataCopyWithImpl<_$_WaterData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WaterDataToJson(
      this,
    );
  }
}

abstract class _WaterData implements WaterData {
  factory _WaterData({final String date, final int timeMl}) = _$_WaterData;

  factory _WaterData.fromJson(Map<String, dynamic> json) =
      _$_WaterData.fromJson;

  @override
  String get date;
  @override
  int get timeMl;
  @override
  @JsonKey(ignore: true)
  _$$_WaterDataCopyWith<_$_WaterData> get copyWith =>
      throw _privateConstructorUsedError;
}
