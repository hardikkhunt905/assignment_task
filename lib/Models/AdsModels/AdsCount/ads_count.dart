import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'ads_count.freezed.dart';
part 'ads_count.g.dart';

@freezed
class AdsCounts with _$AdsCounts {

  factory AdsCounts({
    @Default(2) int appOpenCount,
    @Default(3) int bannerCount,
    @Default(5) int interstitialCount,
    @Default(5) int interstitialVideoCount,
    @Default(5) int rewardedCount,
    @Default(5) int rewardedInterstitialCount,
    @Default(5) int nativeSmallCount,
    @Default(5) int nativeAdvancedCount,
    @Default(5) int nativeAdvancedVideoCount,
    @Default(3) int updateCount,
    @Default(8) int rateUsCount,
  }) = _AdsCounts;

  factory AdsCounts.fromJson(Map<String, Object?> json)
  => _$AdsCountsFromJson(json);
}