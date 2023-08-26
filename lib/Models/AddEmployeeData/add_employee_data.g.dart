// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_employee_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddEmployeeData _$$_AddEmployeeDataFromJson(Map<String, dynamic> json) =>
    _$_AddEmployeeData(
      name: json['name'] as String? ?? "",
      role: json['role'] as String? ?? "",
      fromDate: json['fromDate'] as String? ?? "",
      toDate: json['toDate'] as String? ?? "",
    );

Map<String, dynamic> _$$_AddEmployeeDataToJson(_$_AddEmployeeData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
    };
