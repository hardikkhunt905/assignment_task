import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
class AuthUser with _$AuthUser {

  factory AuthUser({
    String? displayName,
    String? email,
    String? phoneNumber,
    String? photoURL,
    String? uid,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, Object?> json)
  => _$AuthUserFromJson(json);
}