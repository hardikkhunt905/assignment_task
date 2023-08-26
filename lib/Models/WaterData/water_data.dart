import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'water_data.freezed.dart';
part 'water_data.g.dart';

@freezed
class WaterData with _$WaterData {

  factory WaterData({
    @Default("") String date,
    @Default(0) int timeMl,
  }) = _WaterData;

  factory WaterData.fromJson(Map<String, Object?> json)
  => _$WaterDataFromJson(json);
}