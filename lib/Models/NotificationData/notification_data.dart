import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'notification_data.freezed.dart';
part 'notification_data.g.dart';

@freezed
class NotificationData with _$NotificationData {

  factory NotificationData({
    @Default(1) int id,
    @Default("") String date,
    @Default(true) bool isOn,
    @Default([]) List<int> weekDaysId,
    @Default([true, true, true, true, true, true, true]) List<bool> weekDays,
  }) = _NotificationData;

  factory NotificationData.fromJson(Map<String, Object?> json)
  => _$NotificationDataFromJson(json);
}