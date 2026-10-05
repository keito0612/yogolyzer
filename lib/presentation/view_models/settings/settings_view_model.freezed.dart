// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserInfo {

 String get id; String get email; String get provider;
/// Create a copy of UserInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserInfoCopyWith<UserInfo> get copyWith => _$UserInfoCopyWithImpl<UserInfo>(this as UserInfo, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UserInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInfo&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.provider, _this.provider) || other.provider == _this.provider));
}


@override
int get hashCode {
  final _this = this as UserInfo;
  return Object.hash(runtimeType,_this.id,_this.email,_this.provider);
}

@override
String toString() {
  final _this = this as UserInfo;
  return 'UserInfo(id: ${_this.id}, email: ${_this.email}, provider: ${_this.provider})';
}


}

/// @nodoc
abstract mixin class $UserInfoCopyWith<$Res>  {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) _then) = _$UserInfoCopyWithImpl;
@useResult
$Res call({
 String id, String email, String provider
});




}
/// @nodoc
class _$UserInfoCopyWithImpl<$Res>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._self, this._then);

  final UserInfo _self;
  final $Res Function(UserInfo) _then;

/// Create a copy of UserInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? provider = null,}) {
  return _then(UserInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserInfo].
extension UserInfoPatterns on UserInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserInfo value)  $default,){
final _that = this;
switch (_that) {
case _UserInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserInfo value)?  $default,){
final _that = this;
switch (_that) {
case _UserInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String provider)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserInfo() when $default != null:
return $default(_that.id,_that.email,_that.provider);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String provider)  $default,) {final _that = this;
switch (_that) {
case _UserInfo():
return $default(_that.id,_that.email,_that.provider);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String provider)?  $default,) {final _that = this;
switch (_that) {
case _UserInfo() when $default != null:
return $default(_that.id,_that.email,_that.provider);case _:
  return null;

}
}

}

/// @nodoc


class _UserInfo implements UserInfo {
  const _UserInfo({required this.id, required this.email, required this.provider});
  

@override final  String id;
@override final  String email;
@override final  String provider;

/// Create a copy of UserInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserInfoCopyWith<_UserInfo> get copyWith => __$UserInfoCopyWithImpl<_UserInfo>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.provider, provider) || other.provider == provider));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,email,provider);
}

@override
String toString() {
    return 'UserInfo(id: $id, email: $email, provider: $provider)';
}


}

/// @nodoc
abstract mixin class _$UserInfoCopyWith<$Res> implements $UserInfoCopyWith<$Res> {
  factory _$UserInfoCopyWith(_UserInfo value, $Res Function(_UserInfo) _then) = __$UserInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String provider
});




}
/// @nodoc
class __$UserInfoCopyWithImpl<$Res>
    implements _$UserInfoCopyWith<$Res> {
  __$UserInfoCopyWithImpl(this._self, this._then);

  final _UserInfo _self;
  final $Res Function(_UserInfo) _then;

/// Create a copy of UserInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? provider = null,}) {
  return _then(_UserInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$BackupInfo {

 bool get hasBackup; DateTime? get lastBackupAt;
/// Create a copy of BackupInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackupInfoCopyWith<BackupInfo> get copyWith => _$BackupInfoCopyWithImpl<BackupInfo>(this as BackupInfo, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BackupInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupInfo&&(identical(other.hasBackup, _this.hasBackup) || other.hasBackup == _this.hasBackup)&&(identical(other.lastBackupAt, _this.lastBackupAt) || other.lastBackupAt == _this.lastBackupAt));
}


@override
int get hashCode {
  final _this = this as BackupInfo;
  return Object.hash(runtimeType,_this.hasBackup,_this.lastBackupAt);
}

@override
String toString() {
  final _this = this as BackupInfo;
  return 'BackupInfo(hasBackup: ${_this.hasBackup}, lastBackupAt: ${_this.lastBackupAt})';
}


}

/// @nodoc
abstract mixin class $BackupInfoCopyWith<$Res>  {
  factory $BackupInfoCopyWith(BackupInfo value, $Res Function(BackupInfo) _then) = _$BackupInfoCopyWithImpl;
@useResult
$Res call({
 bool hasBackup, DateTime? lastBackupAt
});




}
/// @nodoc
class _$BackupInfoCopyWithImpl<$Res>
    implements $BackupInfoCopyWith<$Res> {
  _$BackupInfoCopyWithImpl(this._self, this._then);

  final BackupInfo _self;
  final $Res Function(BackupInfo) _then;

/// Create a copy of BackupInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasBackup = null,Object? lastBackupAt = freezed,}) {
  return _then(BackupInfo(
hasBackup: null == hasBackup ? _self.hasBackup : hasBackup // ignore: cast_nullable_to_non_nullable
as bool,lastBackupAt: freezed == lastBackupAt ? _self.lastBackupAt : lastBackupAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BackupInfo].
extension BackupInfoPatterns on BackupInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackupInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackupInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackupInfo value)  $default,){
final _that = this;
switch (_that) {
case _BackupInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackupInfo value)?  $default,){
final _that = this;
switch (_that) {
case _BackupInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasBackup,  DateTime? lastBackupAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackupInfo() when $default != null:
return $default(_that.hasBackup,_that.lastBackupAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasBackup,  DateTime? lastBackupAt)  $default,) {final _that = this;
switch (_that) {
case _BackupInfo():
return $default(_that.hasBackup,_that.lastBackupAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasBackup,  DateTime? lastBackupAt)?  $default,) {final _that = this;
switch (_that) {
case _BackupInfo() when $default != null:
return $default(_that.hasBackup,_that.lastBackupAt);case _:
  return null;

}
}

}

/// @nodoc


class _BackupInfo implements BackupInfo {
  const _BackupInfo({required this.hasBackup, this.lastBackupAt});
  

@override final  bool hasBackup;
@override final  DateTime? lastBackupAt;

/// Create a copy of BackupInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackupInfoCopyWith<_BackupInfo> get copyWith => __$BackupInfoCopyWithImpl<_BackupInfo>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackupInfo&&(identical(other.hasBackup, hasBackup) || other.hasBackup == hasBackup)&&(identical(other.lastBackupAt, lastBackupAt) || other.lastBackupAt == lastBackupAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,hasBackup,lastBackupAt);
}

@override
String toString() {
    return 'BackupInfo(hasBackup: $hasBackup, lastBackupAt: $lastBackupAt)';
}


}

/// @nodoc
abstract mixin class _$BackupInfoCopyWith<$Res> implements $BackupInfoCopyWith<$Res> {
  factory _$BackupInfoCopyWith(_BackupInfo value, $Res Function(_BackupInfo) _then) = __$BackupInfoCopyWithImpl;
@override @useResult
$Res call({
 bool hasBackup, DateTime? lastBackupAt
});




}
/// @nodoc
class __$BackupInfoCopyWithImpl<$Res>
    implements _$BackupInfoCopyWith<$Res> {
  __$BackupInfoCopyWithImpl(this._self, this._then);

  final _BackupInfo _self;
  final $Res Function(_BackupInfo) _then;

/// Create a copy of BackupInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasBackup = null,Object? lastBackupAt = freezed,}) {
  return _then(_BackupInfo(
hasBackup: null == hasBackup ? _self.hasBackup : hasBackup // ignore: cast_nullable_to_non_nullable
as bool,lastBackupAt: freezed == lastBackupAt ? _self.lastBackupAt : lastBackupAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$SettingsState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SettingsState()';
}


}

/// @nodoc
class $SettingsStateCopyWith<$Res>  {
$SettingsStateCopyWith(SettingsState _, $Res Function(SettingsState) __);
}


/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SettingsStateLoading value)?  loading,TResult Function( SettingsStateLoaded value)?  loaded,TResult Function( SettingsStateBackingUp value)?  backingUp,TResult Function( SettingsStateRestoring value)?  restoring,TResult Function( SettingsStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SettingsStateLoading() when loading != null:
return loading(_that);case SettingsStateLoaded() when loaded != null:
return loaded(_that);case SettingsStateBackingUp() when backingUp != null:
return backingUp(_that);case SettingsStateRestoring() when restoring != null:
return restoring(_that);case SettingsStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SettingsStateLoading value)  loading,required TResult Function( SettingsStateLoaded value)  loaded,required TResult Function( SettingsStateBackingUp value)  backingUp,required TResult Function( SettingsStateRestoring value)  restoring,required TResult Function( SettingsStateError value)  error,}){
final _that = this;
switch (_that) {
case SettingsStateLoading():
return loading(_that);case SettingsStateLoaded():
return loaded(_that);case SettingsStateBackingUp():
return backingUp(_that);case SettingsStateRestoring():
return restoring(_that);case SettingsStateError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SettingsStateLoading value)?  loading,TResult? Function( SettingsStateLoaded value)?  loaded,TResult? Function( SettingsStateBackingUp value)?  backingUp,TResult? Function( SettingsStateRestoring value)?  restoring,TResult? Function( SettingsStateError value)?  error,}){
final _that = this;
switch (_that) {
case SettingsStateLoading() when loading != null:
return loading(_that);case SettingsStateLoaded() when loaded != null:
return loaded(_that);case SettingsStateBackingUp() when backingUp != null:
return backingUp(_that);case SettingsStateRestoring() when restoring != null:
return restoring(_that);case SettingsStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( UserInfo? userInfo,  bool isPremium,  bool isSyncEnabled,  BackupInfo? backupInfo,  String appVersion)?  loaded,TResult Function( SettingsStateLoaded previousState)?  backingUp,TResult Function( SettingsStateLoaded previousState)?  restoring,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SettingsStateLoading() when loading != null:
return loading();case SettingsStateLoaded() when loaded != null:
return loaded(_that.userInfo,_that.isPremium,_that.isSyncEnabled,_that.backupInfo,_that.appVersion);case SettingsStateBackingUp() when backingUp != null:
return backingUp(_that.previousState);case SettingsStateRestoring() when restoring != null:
return restoring(_that.previousState);case SettingsStateError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( UserInfo? userInfo,  bool isPremium,  bool isSyncEnabled,  BackupInfo? backupInfo,  String appVersion)  loaded,required TResult Function( SettingsStateLoaded previousState)  backingUp,required TResult Function( SettingsStateLoaded previousState)  restoring,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case SettingsStateLoading():
return loading();case SettingsStateLoaded():
return loaded(_that.userInfo,_that.isPremium,_that.isSyncEnabled,_that.backupInfo,_that.appVersion);case SettingsStateBackingUp():
return backingUp(_that.previousState);case SettingsStateRestoring():
return restoring(_that.previousState);case SettingsStateError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( UserInfo? userInfo,  bool isPremium,  bool isSyncEnabled,  BackupInfo? backupInfo,  String appVersion)?  loaded,TResult? Function( SettingsStateLoaded previousState)?  backingUp,TResult? Function( SettingsStateLoaded previousState)?  restoring,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case SettingsStateLoading() when loading != null:
return loading();case SettingsStateLoaded() when loaded != null:
return loaded(_that.userInfo,_that.isPremium,_that.isSyncEnabled,_that.backupInfo,_that.appVersion);case SettingsStateBackingUp() when backingUp != null:
return backingUp(_that.previousState);case SettingsStateRestoring() when restoring != null:
return restoring(_that.previousState);case SettingsStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SettingsStateLoading implements SettingsState {
  const SettingsStateLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SettingsState.loading()';
}


}




/// @nodoc


class SettingsStateLoaded implements SettingsState {
  const SettingsStateLoaded({this.userInfo, this.isPremium = false, this.isSyncEnabled = false, this.backupInfo, this.appVersion = ''});
  

/// ログイン中のユーザー情報（未ログインの場合null）
 final  UserInfo? userInfo;
/// プレミアム会員かどうか
@JsonKey() final  bool isPremium;
/// データ同期が有効かどうか
@JsonKey() final  bool isSyncEnabled;
/// バックアップ情報
 final  BackupInfo? backupInfo;
/// アプリバージョン
@JsonKey() final  String appVersion;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsStateLoadedCopyWith<SettingsStateLoaded> get copyWith => _$SettingsStateLoadedCopyWithImpl<SettingsStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsStateLoaded&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.isSyncEnabled, isSyncEnabled) || other.isSyncEnabled == isSyncEnabled)&&(identical(other.backupInfo, backupInfo) || other.backupInfo == backupInfo)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion));
}


@override
int get hashCode {
    return Object.hash(runtimeType,userInfo,isPremium,isSyncEnabled,backupInfo,appVersion);
}

@override
String toString() {
    return 'SettingsState.loaded(userInfo: $userInfo, isPremium: $isPremium, isSyncEnabled: $isSyncEnabled, backupInfo: $backupInfo, appVersion: $appVersion)';
}


}

/// @nodoc
abstract mixin class $SettingsStateLoadedCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory $SettingsStateLoadedCopyWith(SettingsStateLoaded value, $Res Function(SettingsStateLoaded) _then) = _$SettingsStateLoadedCopyWithImpl;
@useResult
$Res call({
 UserInfo? userInfo, bool isPremium, bool isSyncEnabled, BackupInfo? backupInfo, String appVersion
});


$UserInfoCopyWith<$Res>? get userInfo;$BackupInfoCopyWith<$Res>? get backupInfo;

}
/// @nodoc
class _$SettingsStateLoadedCopyWithImpl<$Res>
    implements $SettingsStateLoadedCopyWith<$Res> {
  _$SettingsStateLoadedCopyWithImpl(this._self, this._then);

  final SettingsStateLoaded _self;
  final $Res Function(SettingsStateLoaded) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userInfo = freezed,Object? isPremium = null,Object? isSyncEnabled = null,Object? backupInfo = freezed,Object? appVersion = null,}) {
  return _then(SettingsStateLoaded(
userInfo: freezed == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as UserInfo?,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,isSyncEnabled: null == isSyncEnabled ? _self.isSyncEnabled : isSyncEnabled // ignore: cast_nullable_to_non_nullable
as bool,backupInfo: freezed == backupInfo ? _self.backupInfo : backupInfo // ignore: cast_nullable_to_non_nullable
as BackupInfo?,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
    return null;
  }

  return $UserInfoCopyWith<$Res>(_self.userInfo!, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackupInfoCopyWith<$Res>? get backupInfo {
    if (_self.backupInfo == null) {
    return null;
  }

  return $BackupInfoCopyWith<$Res>(_self.backupInfo!, (value) {
    return _then(_self.copyWith(backupInfo: value));
  });
}
}

/// @nodoc


class SettingsStateBackingUp implements SettingsState {
  const SettingsStateBackingUp({required this.previousState});
  

 final  SettingsStateLoaded previousState;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsStateBackingUpCopyWith<SettingsStateBackingUp> get copyWith => _$SettingsStateBackingUpCopyWithImpl<SettingsStateBackingUp>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsStateBackingUp&&const DeepCollectionEquality().equals(other.previousState, previousState));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(previousState));
}

@override
String toString() {
    return 'SettingsState.backingUp(previousState: $previousState)';
}


}

/// @nodoc
abstract mixin class $SettingsStateBackingUpCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory $SettingsStateBackingUpCopyWith(SettingsStateBackingUp value, $Res Function(SettingsStateBackingUp) _then) = _$SettingsStateBackingUpCopyWithImpl;
@useResult
$Res call({
 SettingsStateLoaded previousState
});




}
/// @nodoc
class _$SettingsStateBackingUpCopyWithImpl<$Res>
    implements $SettingsStateBackingUpCopyWith<$Res> {
  _$SettingsStateBackingUpCopyWithImpl(this._self, this._then);

  final SettingsStateBackingUp _self;
  final $Res Function(SettingsStateBackingUp) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? previousState = freezed,}) {
  return _then(SettingsStateBackingUp(
previousState: freezed == previousState ? _self.previousState : previousState // ignore: cast_nullable_to_non_nullable
as SettingsStateLoaded,
  ));
}


}

/// @nodoc


class SettingsStateRestoring implements SettingsState {
  const SettingsStateRestoring({required this.previousState});
  

 final  SettingsStateLoaded previousState;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsStateRestoringCopyWith<SettingsStateRestoring> get copyWith => _$SettingsStateRestoringCopyWithImpl<SettingsStateRestoring>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsStateRestoring&&const DeepCollectionEquality().equals(other.previousState, previousState));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(previousState));
}

@override
String toString() {
    return 'SettingsState.restoring(previousState: $previousState)';
}


}

/// @nodoc
abstract mixin class $SettingsStateRestoringCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory $SettingsStateRestoringCopyWith(SettingsStateRestoring value, $Res Function(SettingsStateRestoring) _then) = _$SettingsStateRestoringCopyWithImpl;
@useResult
$Res call({
 SettingsStateLoaded previousState
});




}
/// @nodoc
class _$SettingsStateRestoringCopyWithImpl<$Res>
    implements $SettingsStateRestoringCopyWith<$Res> {
  _$SettingsStateRestoringCopyWithImpl(this._self, this._then);

  final SettingsStateRestoring _self;
  final $Res Function(SettingsStateRestoring) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? previousState = freezed,}) {
  return _then(SettingsStateRestoring(
previousState: freezed == previousState ? _self.previousState : previousState // ignore: cast_nullable_to_non_nullable
as SettingsStateLoaded,
  ));
}


}

/// @nodoc


class SettingsStateError implements SettingsState {
  const SettingsStateError({required this.message});
  

 final  String message;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsStateErrorCopyWith<SettingsStateError> get copyWith => _$SettingsStateErrorCopyWithImpl<SettingsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'SettingsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SettingsStateErrorCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory $SettingsStateErrorCopyWith(SettingsStateError value, $Res Function(SettingsStateError) _then) = _$SettingsStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SettingsStateErrorCopyWithImpl<$Res>
    implements $SettingsStateErrorCopyWith<$Res> {
  _$SettingsStateErrorCopyWithImpl(this._self, this._then);

  final SettingsStateError _self;
  final $Res Function(SettingsStateError) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SettingsStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
