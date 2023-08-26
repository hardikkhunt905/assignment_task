// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_employee_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddEmployeeData _$AddEmployeeDataFromJson(Map<String, dynamic> json) {
  return _AddEmployeeData.fromJson(json);
}

/// @nodoc
mixin _$AddEmployeeData {
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get fromDate => throw _privateConstructorUsedError;
  String get toDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddEmployeeDataCopyWith<AddEmployeeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEmployeeDataCopyWith<$Res> {
  factory $AddEmployeeDataCopyWith(
          AddEmployeeData value, $Res Function(AddEmployeeData) then) =
      _$AddEmployeeDataCopyWithImpl<$Res, AddEmployeeData>;
  @useResult
  $Res call({String name, String role, String fromDate, String toDate});
}

/// @nodoc
class _$AddEmployeeDataCopyWithImpl<$Res, $Val extends AddEmployeeData>
    implements $AddEmployeeDataCopyWith<$Res> {
  _$AddEmployeeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? role = null,
    Object? fromDate = null,
    Object? toDate = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as String,
      toDate: null == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddEmployeeDataCopyWith<$Res>
    implements $AddEmployeeDataCopyWith<$Res> {
  factory _$$_AddEmployeeDataCopyWith(
          _$_AddEmployeeData value, $Res Function(_$_AddEmployeeData) then) =
      __$$_AddEmployeeDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String role, String fromDate, String toDate});
}

/// @nodoc
class __$$_AddEmployeeDataCopyWithImpl<$Res>
    extends _$AddEmployeeDataCopyWithImpl<$Res, _$_AddEmployeeData>
    implements _$$_AddEmployeeDataCopyWith<$Res> {
  __$$_AddEmployeeDataCopyWithImpl(
      _$_AddEmployeeData _value, $Res Function(_$_AddEmployeeData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? role = null,
    Object? fromDate = null,
    Object? toDate = null,
  }) {
    return _then(_$_AddEmployeeData(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as String,
      toDate: null == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddEmployeeData
    with DiagnosticableTreeMixin
    implements _AddEmployeeData {
  _$_AddEmployeeData(
      {this.name = "", this.role = "", this.fromDate = "", this.toDate = ""});

  factory _$_AddEmployeeData.fromJson(Map<String, dynamic> json) =>
      _$$_AddEmployeeDataFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final String fromDate;
  @override
  @JsonKey()
  final String toDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddEmployeeData(name: $name, role: $role, fromDate: $fromDate, toDate: $toDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddEmployeeData'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('role', role))
      ..add(DiagnosticsProperty('fromDate', fromDate))
      ..add(DiagnosticsProperty('toDate', toDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddEmployeeData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, role, fromDate, toDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddEmployeeDataCopyWith<_$_AddEmployeeData> get copyWith =>
      __$$_AddEmployeeDataCopyWithImpl<_$_AddEmployeeData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddEmployeeDataToJson(
      this,
    );
  }
}

abstract class _AddEmployeeData implements AddEmployeeData {
  factory _AddEmployeeData(
      {final String name,
      final String role,
      final String fromDate,
      final String toDate}) = _$_AddEmployeeData;

  factory _AddEmployeeData.fromJson(Map<String, dynamic> json) =
      _$_AddEmployeeData.fromJson;

  @override
  String get name;
  @override
  String get role;
  @override
  String get fromDate;
  @override
  String get toDate;
  @override
  @JsonKey(ignore: true)
  _$$_AddEmployeeDataCopyWith<_$_AddEmployeeData> get copyWith =>
      throw _privateConstructorUsedError;
}
