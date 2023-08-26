// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppData _$AppDataFromJson(Map<String, dynamic> json) {
  return _AppData.fromJson(json);
}

/// @nodoc
mixin _$AppData {
  String get packageName => throw _privateConstructorUsedError;
  String get versionName => throw _privateConstructorUsedError;
  String get updateAppUrl => throw _privateConstructorUsedError;
  int get isUpdate => throw _privateConstructorUsedError;
  Map<String, dynamic> get googleAds => throw _privateConstructorUsedError;
  Map<String, dynamic> get fbAds => throw _privateConstructorUsedError;
  Map<String, dynamic> get adCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppDataCopyWith<AppData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppDataCopyWith<$Res> {
  factory $AppDataCopyWith(AppData value, $Res Function(AppData) then) =
      _$AppDataCopyWithImpl<$Res>;
  $Res call(
      {String packageName,
      String versionName,
      String updateAppUrl,
      int isUpdate,
      Map<String, dynamic> googleAds,
      Map<String, dynamic> fbAds,
      Map<String, dynamic> adCount});
}

/// @nodoc
class _$AppDataCopyWithImpl<$Res> implements $AppDataCopyWith<$Res> {
  _$AppDataCopyWithImpl(this._value, this._then);

  final AppData _value;
  // ignore: unused_field
  final $Res Function(AppData) _then;

  @override
  $Res call({
    Object? packageName = freezed,
    Object? versionName = freezed,
    Object? updateAppUrl = freezed,
    Object? isUpdate = freezed,
    Object? googleAds = freezed,
    Object? fbAds = freezed,
    Object? adCount = freezed,
  }) {
    return _then(_value.copyWith(
      packageName: packageName == freezed
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      versionName: versionName == freezed
          ? _value.versionName
          : versionName // ignore: cast_nullable_to_non_nullable
              as String,
      updateAppUrl: updateAppUrl == freezed
          ? _value.updateAppUrl
          : updateAppUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isUpdate: isUpdate == freezed
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as int,
      googleAds: googleAds == freezed
          ? _value.googleAds
          : googleAds // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      fbAds: fbAds == freezed
          ? _value.fbAds
          : fbAds // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      adCount: adCount == freezed
          ? _value.adCount
          : adCount // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$$_AppDataCopyWith<$Res> implements $AppDataCopyWith<$Res> {
  factory _$$_AppDataCopyWith(
          _$_AppData value, $Res Function(_$_AppData) then) =
      __$$_AppDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String packageName,
      String versionName,
      String updateAppUrl,
      int isUpdate,
      Map<String, dynamic> googleAds,
      Map<String, dynamic> fbAds,
      Map<String, dynamic> adCount});
}

/// @nodoc
class __$$_AppDataCopyWithImpl<$Res> extends _$AppDataCopyWithImpl<$Res>
    implements _$$_AppDataCopyWith<$Res> {
  __$$_AppDataCopyWithImpl(_$_AppData _value, $Res Function(_$_AppData) _then)
      : super(_value, (v) => _then(v as _$_AppData));

  @override
  _$_AppData get _value => super._value as _$_AppData;

  @override
  $Res call({
    Object? packageName = freezed,
    Object? versionName = freezed,
    Object? updateAppUrl = freezed,
    Object? isUpdate = freezed,
    Object? googleAds = freezed,
    Object? fbAds = freezed,
    Object? adCount = freezed,
  }) {
    return _then(_$_AppData(
      packageName: packageName == freezed
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      versionName: versionName == freezed
          ? _value.versionName
          : versionName // ignore: cast_nullable_to_non_nullable
              as String,
      updateAppUrl: updateAppUrl == freezed
          ? _value.updateAppUrl
          : updateAppUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isUpdate: isUpdate == freezed
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as int,
      googleAds: googleAds == freezed
          ? _value._googleAds
          : googleAds // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      fbAds: fbAds == freezed
          ? _value._fbAds
          : fbAds // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      adCount: adCount == freezed
          ? _value._adCount
          : adCount // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppData with DiagnosticableTreeMixin implements _AppData {
  _$_AppData(
      {this.packageName = "",
      this.versionName = "",
      this.updateAppUrl = "",
      this.isUpdate = 0,
      final Map<String, dynamic> googleAds = const {},
      final Map<String, dynamic> fbAds = const {},
      final Map<String, dynamic> adCount = const {}})
      : _googleAds = googleAds,
        _fbAds = fbAds,
        _adCount = adCount;

  factory _$_AppData.fromJson(Map<String, dynamic> json) =>
      _$$_AppDataFromJson(json);

  @override
  @JsonKey()
  final String packageName;
  @override
  @JsonKey()
  final String versionName;
  @override
  @JsonKey()
  final String updateAppUrl;
  @override
  @JsonKey()
  final int isUpdate;
  final Map<String, dynamic> _googleAds;
  @override
  @JsonKey()
  Map<String, dynamic> get googleAds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_googleAds);
  }

  final Map<String, dynamic> _fbAds;
  @override
  @JsonKey()
  Map<String, dynamic> get fbAds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_fbAds);
  }

  final Map<String, dynamic> _adCount;
  @override
  @JsonKey()
  Map<String, dynamic> get adCount {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_adCount);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppData(packageName: $packageName, versionName: $versionName, updateAppUrl: $updateAppUrl, isUpdate: $isUpdate, googleAds: $googleAds, fbAds: $fbAds, adCount: $adCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppData'))
      ..add(DiagnosticsProperty('packageName', packageName))
      ..add(DiagnosticsProperty('versionName', versionName))
      ..add(DiagnosticsProperty('updateAppUrl', updateAppUrl))
      ..add(DiagnosticsProperty('isUpdate', isUpdate))
      ..add(DiagnosticsProperty('googleAds', googleAds))
      ..add(DiagnosticsProperty('fbAds', fbAds))
      ..add(DiagnosticsProperty('adCount', adCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppData &&
            const DeepCollectionEquality()
                .equals(other.packageName, packageName) &&
            const DeepCollectionEquality()
                .equals(other.versionName, versionName) &&
            const DeepCollectionEquality()
                .equals(other.updateAppUrl, updateAppUrl) &&
            const DeepCollectionEquality().equals(other.isUpdate, isUpdate) &&
            const DeepCollectionEquality()
                .equals(other._googleAds, _googleAds) &&
            const DeepCollectionEquality().equals(other._fbAds, _fbAds) &&
            const DeepCollectionEquality().equals(other._adCount, _adCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(packageName),
      const DeepCollectionEquality().hash(versionName),
      const DeepCollectionEquality().hash(updateAppUrl),
      const DeepCollectionEquality().hash(isUpdate),
      const DeepCollectionEquality().hash(_googleAds),
      const DeepCollectionEquality().hash(_fbAds),
      const DeepCollectionEquality().hash(_adCount));

  @JsonKey(ignore: true)
  @override
  _$$_AppDataCopyWith<_$_AppData> get copyWith =>
      __$$_AppDataCopyWithImpl<_$_AppData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppDataToJson(
      this,
    );
  }
}

abstract class _AppData implements AppData {
  factory _AppData(
      {final String packageName,
      final String versionName,
      final String updateAppUrl,
      final int isUpdate,
      final Map<String, dynamic> googleAds,
      final Map<String, dynamic> fbAds,
      final Map<String, dynamic> adCount}) = _$_AppData;

  factory _AppData.fromJson(Map<String, dynamic> json) = _$_AppData.fromJson;

  @override
  String get packageName;
  @override
  String get versionName;
  @override
  String get updateAppUrl;
  @override
  int get isUpdate;
  @override
  Map<String, dynamic> get googleAds;
  @override
  Map<String, dynamic> get fbAds;
  @override
  Map<String, dynamic> get adCount;
  @override
  @JsonKey(ignore: true)
  _$$_AppDataCopyWith<_$_AppData> get copyWith =>
      throw _privateConstructorUsedError;
}
