import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'ads_type.freezed.dart';
part 'ads_type.g.dart';

@freezed
class AdsType with _$AdsType {

  factory AdsType({
    @Default("") String appOpen,
    @Default("") String banner,
    @Default("") String interstitial,
    @Default("") String interstitialVideo,
    @Default("") String rewarded,
    @Default("") String rewardedInterstitial,
    @Default("") String nativeAdvanced,
    @Default("") String nativeAdvancedVideo,
  }) = _AdsType;

  factory AdsType.fromJson(Map<String, Object?> json)
  => _$AdsTypeFromJson(json);
}