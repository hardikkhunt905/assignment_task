// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationData _$$_NotificationDataFromJson(Map<String, dynamic> json) =>
    _$_NotificationData(
      id: json['id'] as int? ?? 1,
      date: json['date'] as String? ?? "",
      isOn: json['isOn'] as bool? ?? true,
      weekDaysId: (json['weekDaysId'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      weekDays: (json['weekDays'] as List<dynamic>?)
              ?.map((e) => e as bool)
              .toList() ??
          const [true, true, true, true, true, true, true],
    );

Map<String, dynamic> _$$_NotificationDataToJson(_$_NotificationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'isOn': instance.isOn,
      'weekDaysId': instance.weekDaysId,
      'weekDays': instance.weekDays,
    };
