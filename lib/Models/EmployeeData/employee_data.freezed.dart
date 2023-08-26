// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmployeeData _$EmployeeDataFromJson(Map<String, dynamic> json) {
  return _EmployeeData.fromJson(json);
}

/// @nodoc
mixin _$EmployeeData {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get fromDate => throw _privateConstructorUsedError;
  String get toDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeDataCopyWith<EmployeeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeDataCopyWith<$Res> {
  factory $EmployeeDataCopyWith(
          EmployeeData value, $Res Function(EmployeeData) then) =
      _$EmployeeDataCopyWithImpl<$Res, EmployeeData>;
  @useResult
  $Res call({int id, String name, String role, String fromDate, String toDate});
}

/// @nodoc
class _$EmployeeDataCopyWithImpl<$Res, $Val extends EmployeeData>
    implements $EmployeeDataCopyWith<$Res> {
  _$EmployeeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? fromDate = null,
    Object? toDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_EmployeeDataCopyWith<$Res>
    implements $EmployeeDataCopyWith<$Res> {
  factory _$$_EmployeeDataCopyWith(
          _$_EmployeeData value, $Res Function(_$_EmployeeData) then) =
      __$$_EmployeeDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String role, String fromDate, String toDate});
}

/// @nodoc
class __$$_EmployeeDataCopyWithImpl<$Res>
    extends _$EmployeeDataCopyWithImpl<$Res, _$_EmployeeData>
    implements _$$_EmployeeDataCopyWith<$Res> {
  __$$_EmployeeDataCopyWithImpl(
      _$_EmployeeData _value, $Res Function(_$_EmployeeData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? fromDate = null,
    Object? toDate = null,
  }) {
    return _then(_$_EmployeeData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_EmployeeData with DiagnosticableTreeMixin implements _EmployeeData {
  _$_EmployeeData(
      {this.id = 0,
      this.name = "",
      this.role = "",
      this.fromDate = "",
      this.toDate = ""});

  factory _$_EmployeeData.fromJson(Map<String, dynamic> json) =>
      _$$_EmployeeDataFromJson(json);

  @override
  @JsonKey()
  final int id;
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
    return 'EmployeeData(id: $id, name: $name, role: $role, fromDate: $fromDate, toDate: $toDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EmployeeData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('role', role))
      ..add(DiagnosticsProperty('fromDate', fromDate))
      ..add(DiagnosticsProperty('toDate', toDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmployeeData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, role, fromDate, toDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmployeeDataCopyWith<_$_EmployeeData> get copyWith =>
      __$$_EmployeeDataCopyWithImpl<_$_EmployeeData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmployeeDataToJson(
      this,
    );
  }
}

abstract class _EmployeeData implements EmployeeData {
  factory _EmployeeData(
      {final int id,
      final String name,
      final String role,
      final String fromDate,
      final String toDate}) = _$_EmployeeData;

  factory _EmployeeData.fromJson(Map<String, dynamic> json) =
      _$_EmployeeData.fromJson;

  @override
  int get id;
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
  _$$_EmployeeDataCopyWith<_$_EmployeeData> get copyWith =>
      throw _privateConstructorUsedError;
}
