// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppData _$$_AppDataFromJson(Map<String, dynamic> json) => _$_AppData(
      packageName: json['packageName'] as String? ?? "",
      versionName: json['versionName'] as String? ?? "",
      updateAppUrl: json['updateAppUrl'] as String? ?? "",
      isUpdate: json['isUpdate'] as int? ?? 0,
      googleAds: json['googleAds'] as Map<String, dynamic>? ?? const {},
      fbAds: json['fbAds'] as Map<String, dynamic>? ?? const {},
      adCount: json['adCount'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$_AppDataToJson(_$_AppData instance) =>
    <String, dynamic>{
      'packageName': instance.packageName,
      'versionName': instance.versionName,
      'updateAppUrl': instance.updateAppUrl,
      'isUpdate': instance.isUpdate,
      'googleAds': instance.googleAds,
      'fbAds': instance.fbAds,
      'adCount': instance.adCount,
    };
