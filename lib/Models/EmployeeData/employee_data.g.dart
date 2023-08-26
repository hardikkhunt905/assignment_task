// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmployeeData _$$_EmployeeDataFromJson(Map<String, dynamic> json) =>
    _$_EmployeeData(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      role: json['role'] as String? ?? "",
      fromDate: json['fromDate'] as String? ?? "",
      toDate: json['toDate'] as String? ?? "",
    );

Map<String, dynamic> _$$_EmployeeDataToJson(_$_EmployeeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
    };
