import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {

  factory UserData({
    @Default("User Name") String name,
    @Default("") String email,
    @Default("") String phoneNumber,
    @Default("") String profileImage,
    @Default(0.00) double totalCount,
  }) = _UserData;

  factory UserData.fromJson(Map<String, Object?> json)
  => _$UserDataFromJson(json);
}