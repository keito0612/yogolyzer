// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Settings {

 String get deviceId; bool get isLoggedIn; String? get userId; bool get isPremium; int get dailyDiagnosisCount; DateTime? get lastDiagnosisDate;
/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsCopyWith<Settings> get copyWith => _$SettingsCopyWithImpl<Settings>(this as Settings, _$identity);

  /// Serializes this Settings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Settings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Settings&&(identical(other.deviceId, _this.deviceId) || other.deviceId == _this.deviceId)&&(identical(other.isLoggedIn, _this.isLoggedIn) || other.isLoggedIn == _this.isLoggedIn)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.isPremium, _this.isPremium) || other.isPremium == _this.isPremium)&&(identical(other.dailyDiagnosisCount, _this.dailyDiagnosisCount) || other.dailyDiagnosisCount == _this.dailyDiagnosisCount)&&(identical(other.lastDiagnosisDate, _this.lastDiagnosisDate) || other.lastDiagnosisDate == _this.lastDiagnosisDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Settings;
  return Object.hash(runtimeType,_this.deviceId,_this.isLoggedIn,_this.userId,_this.isPremium,_this.dailyDiagnosisCount,_this.lastDiagnosisDate);
}

@override
String toString() {
  final _this = this as Settings;
  return 'Settings(deviceId: ${_this.deviceId}, isLoggedIn: ${_this.isLoggedIn}, userId: ${_this.userId}, isPremium: ${_this.isPremium}, dailyDiagnosisCount: ${_this.dailyDiagnosisCount}, lastDiagnosisDate: ${_this.lastDiagnosisDate})';
}


}

/// @nodoc
abstract mixin class $SettingsCopyWith<$Res>  {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) _then) = _$SettingsCopyWithImpl;
@useResult
$Res call({
 String deviceId, bool isLoggedIn, String? userId, bool isPremium, int dailyDiagnosisCount, DateTime? lastDiagnosisDate
});




}
/// @nodoc
class _$SettingsCopyWithImpl<$Res>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._self, this._then);

  final Settings _self;
  final $Res Function(Settings) _then;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,Object? isLoggedIn = null,Object? userId = freezed,Object? isPremium = null,Object? dailyDiagnosisCount = null,Object? lastDiagnosisDate = freezed,}) {
  return _then(Settings(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,dailyDiagnosisCount: null == dailyDiagnosisCount ? _self.dailyDiagnosisCount : dailyDiagnosisCount // ignore: cast_nullable_to_non_nullable
as int,lastDiagnosisDate: freezed == lastDiagnosisDate ? _self.lastDiagnosisDate : lastDiagnosisDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Settings].
extension SettingsPatterns on Settings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Settings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Settings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Settings value)  $default,){
final _that = this;
switch (_that) {
case _Settings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Settings value)?  $default,){
final _that = this;
switch (_that) {
case _Settings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceId,  bool isLoggedIn,  String? userId,  bool isPremium,  int dailyDiagnosisCount,  DateTime? lastDiagnosisDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Settings() when $default != null:
return $default(_that.deviceId,_that.isLoggedIn,_that.userId,_that.isPremium,_that.dailyDiagnosisCount,_that.lastDiagnosisDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceId,  bool isLoggedIn,  String? userId,  bool isPremium,  int dailyDiagnosisCount,  DateTime? lastDiagnosisDate)  $default,) {final _that = this;
switch (_that) {
case _Settings():
return $default(_that.deviceId,_that.isLoggedIn,_that.userId,_that.isPremium,_that.dailyDiagnosisCount,_that.lastDiagnosisDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceId,  bool isLoggedIn,  String? userId,  bool isPremium,  int dailyDiagnosisCount,  DateTime? lastDiagnosisDate)?  $default,) {final _that = this;
switch (_that) {
case _Settings() when $default != null:
return $default(_that.deviceId,_that.isLoggedIn,_that.userId,_that.isPremium,_that.dailyDiagnosisCount,_that.lastDiagnosisDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Settings implements Settings {
  const _Settings({required this.deviceId, this.isLoggedIn = false, this.userId, this.isPremium = false, this.dailyDiagnosisCount = 0, this.lastDiagnosisDate});
  factory _Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);

@override final  String deviceId;
@override@JsonKey() final  bool isLoggedIn;
@override final  String? userId;
@override@JsonKey() final  bool isPremium;
@override@JsonKey() final  int dailyDiagnosisCount;
@override final  DateTime? lastDiagnosisDate;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsCopyWith<_Settings> get copyWith => __$SettingsCopyWithImpl<_Settings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Settings&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.dailyDiagnosisCount, dailyDiagnosisCount) || other.dailyDiagnosisCount == dailyDiagnosisCount)&&(identical(other.lastDiagnosisDate, lastDiagnosisDate) || other.lastDiagnosisDate == lastDiagnosisDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,deviceId,isLoggedIn,userId,isPremium,dailyDiagnosisCount,lastDiagnosisDate);
}

@override
String toString() {
    return 'Settings(deviceId: $deviceId, isLoggedIn: $isLoggedIn, userId: $userId, isPremium: $isPremium, dailyDiagnosisCount: $dailyDiagnosisCount, lastDiagnosisDate: $lastDiagnosisDate)';
}


}

/// @nodoc
abstract mixin class _$SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) _then) = __$SettingsCopyWithImpl;
@override @useResult
$Res call({
 String deviceId, bool isLoggedIn, String? userId, bool isPremium, int dailyDiagnosisCount, DateTime? lastDiagnosisDate
});




}
/// @nodoc
class __$SettingsCopyWithImpl<$Res>
    implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(this._self, this._then);

  final _Settings _self;
  final $Res Function(_Settings) _then;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,Object? isLoggedIn = null,Object? userId = freezed,Object? isPremium = null,Object? dailyDiagnosisCount = null,Object? lastDiagnosisDate = freezed,}) {
  return _then(_Settings(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,dailyDiagnosisCount: null == dailyDiagnosisCount ? _self.dailyDiagnosisCount : dailyDiagnosisCount // ignore: cast_nullable_to_non_nullable
as int,lastDiagnosisDate: freezed == lastDiagnosisDate ? _self.lastDiagnosisDate : lastDiagnosisDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
