import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'employee_data.freezed.dart';
part 'employee_data.g.dart';

@freezed
class EmployeeData with _$EmployeeData {

  factory EmployeeData({
    @Default(0) int id,
    @Default("") String name,
    @Default("") String role,
    @Default("") String fromDate,
    @Default("") String toDate,
  }) = _EmployeeData;

  factory EmployeeData.fromJson(Map<String, Object?> json)
  => _$EmployeeDataFromJson(json);
}