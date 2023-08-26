import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'add_employee_data.freezed.dart';
part 'add_employee_data.g.dart';

@freezed
class AddEmployeeData with _$AddEmployeeData {

  factory AddEmployeeData({
    @Default("") String name,
    @Default("") String role,
    @Default("") String fromDate,
    @Default("") String toDate,
  }) = _AddEmployeeData;

  factory AddEmployeeData.fromJson(Map<String, Object?> json)
  => _$AddEmployeeDataFromJson(json);
}