import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'app_data.freezed.dart';
part 'app_data.g.dart';

@freezed
class AppData with _$AppData {

  factory AppData({
    @Default("") String packageName,
    @Default("") String versionName,
    @Default("") String updateAppUrl,
    @Default(0) int isUpdate,
    @Default({}) Map<String,dynamic> googleAds,
    @Default({}) Map<String,dynamic> fbAds,
    @Default({}) Map<String,dynamic> adCount,
  }) = _AppData;

  factory AppData.fromJson(Map<String, Object?> json)
  => _$AppDataFromJson(json);
}