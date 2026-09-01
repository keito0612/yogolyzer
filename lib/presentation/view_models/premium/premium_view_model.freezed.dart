// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premium_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlanInfo {

 PremiumPlan get plan; String get name; int get price; String get period; String? get savings;
/// Create a copy of PlanInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanInfoCopyWith<PlanInfo> get copyWith => _$PlanInfoCopyWithImpl<PlanInfo>(this as PlanInfo, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlanInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanInfo&&(identical(other.plan, _this.plan) || other.plan == _this.plan)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.period, _this.period) || other.period == _this.period)&&(identical(other.savings, _this.savings) || other.savings == _this.savings));
}


@override
int get hashCode {
  final _this = this as PlanInfo;
  return Object.hash(runtimeType,_this.plan,_this.name,_this.price,_this.period,_this.savings);
}

@override
String toString() {
  final _this = this as PlanInfo;
  return 'PlanInfo(plan: ${_this.plan}, name: ${_this.name}, price: ${_this.price}, period: ${_this.period}, savings: ${_this.savings})';
}


}

/// @nodoc
abstract mixin class $PlanInfoCopyWith<$Res>  {
  factory $PlanInfoCopyWith(PlanInfo value, $Res Function(PlanInfo) _then) = _$PlanInfoCopyWithImpl;
@useResult
$Res call({
 PremiumPlan plan, String name, int price, String period, String? savings
});




}
/// @nodoc
class _$PlanInfoCopyWithImpl<$Res>
    implements $PlanInfoCopyWith<$Res> {
  _$PlanInfoCopyWithImpl(this._self, this._then);

  final PlanInfo _self;
  final $Res Function(PlanInfo) _then;

/// Create a copy of PlanInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plan = null,Object? name = null,Object? price = null,Object? period = null,Object? savings = freezed,}) {
  return _then(PlanInfo(
plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PremiumPlan,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,savings: freezed == savings ? _self.savings : savings // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanInfo].
extension PlanInfoPatterns on PlanInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanInfo value)  $default,){
final _that = this;
switch (_that) {
case _PlanInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PlanInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PremiumPlan plan,  String name,  int price,  String period,  String? savings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanInfo() when $default != null:
return $default(_that.plan,_that.name,_that.price,_that.period,_that.savings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PremiumPlan plan,  String name,  int price,  String period,  String? savings)  $default,) {final _that = this;
switch (_that) {
case _PlanInfo():
return $default(_that.plan,_that.name,_that.price,_that.period,_that.savings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PremiumPlan plan,  String name,  int price,  String period,  String? savings)?  $default,) {final _that = this;
switch (_that) {
case _PlanInfo() when $default != null:
return $default(_that.plan,_that.name,_that.price,_that.period,_that.savings);case _:
  return null;

}
}

}

/// @nodoc


class _PlanInfo implements PlanInfo {
  const _PlanInfo({required this.plan, required this.name, required this.price, required this.period, this.savings});
  

@override final  PremiumPlan plan;
@override final  String name;
@override final  int price;
@override final  String period;
@override final  String? savings;

/// Create a copy of PlanInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanInfoCopyWith<_PlanInfo> get copyWith => __$PlanInfoCopyWithImpl<_PlanInfo>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanInfo&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.period, period) || other.period == period)&&(identical(other.savings, savings) || other.savings == savings));
}


@override
int get hashCode {
    return Object.hash(runtimeType,plan,name,price,period,savings);
}

@override
String toString() {
    return 'PlanInfo(plan: $plan, name: $name, price: $price, period: $period, savings: $savings)';
}


}

/// @nodoc
abstract mixin class _$PlanInfoCopyWith<$Res> implements $PlanInfoCopyWith<$Res> {
  factory _$PlanInfoCopyWith(_PlanInfo value, $Res Function(_PlanInfo) _then) = __$PlanInfoCopyWithImpl;
@override @useResult
$Res call({
 PremiumPlan plan, String name, int price, String period, String? savings
});




}
/// @nodoc
class __$PlanInfoCopyWithImpl<$Res>
    implements _$PlanInfoCopyWith<$Res> {
  __$PlanInfoCopyWithImpl(this._self, this._then);

  final _PlanInfo _self;
  final $Res Function(_PlanInfo) _then;

/// Create a copy of PlanInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plan = null,Object? name = null,Object? price = null,Object? period = null,Object? savings = freezed,}) {
  return _then(_PlanInfo(
plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PremiumPlan,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,savings: freezed == savings ? _self.savings : savings // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$PremiumState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PremiumState()';
}


}

/// @nodoc
class $PremiumStateCopyWith<$Res>  {
$PremiumStateCopyWith(PremiumState _, $Res Function(PremiumState) __);
}


/// Adds pattern-matching-related methods to [PremiumState].
extension PremiumStatePatterns on PremiumState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PremiumStateLoading value)?  loading,TResult Function( PremiumStateLoaded value)?  loaded,TResult Function( PremiumStatePurchasing value)?  purchasing,TResult Function( PremiumStatePurchaseSuccess value)?  purchaseSuccess,TResult Function( PremiumStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PremiumStateLoading() when loading != null:
return loading(_that);case PremiumStateLoaded() when loaded != null:
return loaded(_that);case PremiumStatePurchasing() when purchasing != null:
return purchasing(_that);case PremiumStatePurchaseSuccess() when purchaseSuccess != null:
return purchaseSuccess(_that);case PremiumStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PremiumStateLoading value)  loading,required TResult Function( PremiumStateLoaded value)  loaded,required TResult Function( PremiumStatePurchasing value)  purchasing,required TResult Function( PremiumStatePurchaseSuccess value)  purchaseSuccess,required TResult Function( PremiumStateError value)  error,}){
final _that = this;
switch (_that) {
case PremiumStateLoading():
return loading(_that);case PremiumStateLoaded():
return loaded(_that);case PremiumStatePurchasing():
return purchasing(_that);case PremiumStatePurchaseSuccess():
return purchaseSuccess(_that);case PremiumStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PremiumStateLoading value)?  loading,TResult? Function( PremiumStateLoaded value)?  loaded,TResult? Function( PremiumStatePurchasing value)?  purchasing,TResult? Function( PremiumStatePurchaseSuccess value)?  purchaseSuccess,TResult? Function( PremiumStateError value)?  error,}){
final _that = this;
switch (_that) {
case PremiumStateLoading() when loading != null:
return loading(_that);case PremiumStateLoaded() when loaded != null:
return loaded(_that);case PremiumStatePurchasing() when purchasing != null:
return purchasing(_that);case PremiumStatePurchaseSuccess() when purchaseSuccess != null:
return purchaseSuccess(_that);case PremiumStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( PremiumPlan selectedPlan,  List<PlanInfo> plans,  bool isPremium)?  loaded,TResult Function( PremiumPlan plan)?  purchasing,TResult Function()?  purchaseSuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PremiumStateLoading() when loading != null:
return loading();case PremiumStateLoaded() when loaded != null:
return loaded(_that.selectedPlan,_that.plans,_that.isPremium);case PremiumStatePurchasing() when purchasing != null:
return purchasing(_that.plan);case PremiumStatePurchaseSuccess() when purchaseSuccess != null:
return purchaseSuccess();case PremiumStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( PremiumPlan selectedPlan,  List<PlanInfo> plans,  bool isPremium)  loaded,required TResult Function( PremiumPlan plan)  purchasing,required TResult Function()  purchaseSuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case PremiumStateLoading():
return loading();case PremiumStateLoaded():
return loaded(_that.selectedPlan,_that.plans,_that.isPremium);case PremiumStatePurchasing():
return purchasing(_that.plan);case PremiumStatePurchaseSuccess():
return purchaseSuccess();case PremiumStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( PremiumPlan selectedPlan,  List<PlanInfo> plans,  bool isPremium)?  loaded,TResult? Function( PremiumPlan plan)?  purchasing,TResult? Function()?  purchaseSuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case PremiumStateLoading() when loading != null:
return loading();case PremiumStateLoaded() when loaded != null:
return loaded(_that.selectedPlan,_that.plans,_that.isPremium);case PremiumStatePurchasing() when purchasing != null:
return purchasing(_that.plan);case PremiumStatePurchaseSuccess() when purchaseSuccess != null:
return purchaseSuccess();case PremiumStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class PremiumStateLoading implements PremiumState {
  const PremiumStateLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PremiumState.loading()';
}


}




/// @nodoc


class PremiumStateLoaded implements PremiumState {
  const PremiumStateLoaded({required this.selectedPlan, required  List<PlanInfo> plans, this.isPremium = false}): _plans = plans;
  

/// 選択中のプラン
 final  PremiumPlan selectedPlan;
/// プラン情報一覧
 final  List<PlanInfo> _plans;
/// プラン情報一覧
 List<PlanInfo> get plans {
  if (_plans is EqualUnmodifiableListView) return _plans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plans);
}

/// 既にプレミアム会員かどうか
@JsonKey() final  bool isPremium;

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PremiumStateLoadedCopyWith<PremiumStateLoaded> get copyWith => _$PremiumStateLoadedCopyWithImpl<PremiumStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumStateLoaded&&(identical(other.selectedPlan, selectedPlan) || other.selectedPlan == selectedPlan)&&const DeepCollectionEquality().equals(other.plans, _plans)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium));
}


@override
int get hashCode {
    return Object.hash(runtimeType,selectedPlan,const DeepCollectionEquality().hash(_plans),isPremium);
}

@override
String toString() {
    return 'PremiumState.loaded(selectedPlan: $selectedPlan, plans: $plans, isPremium: $isPremium)';
}


}

/// @nodoc
abstract mixin class $PremiumStateLoadedCopyWith<$Res> implements $PremiumStateCopyWith<$Res> {
  factory $PremiumStateLoadedCopyWith(PremiumStateLoaded value, $Res Function(PremiumStateLoaded) _then) = _$PremiumStateLoadedCopyWithImpl;
@useResult
$Res call({
 PremiumPlan selectedPlan, List<PlanInfo> plans, bool isPremium
});




}
/// @nodoc
class _$PremiumStateLoadedCopyWithImpl<$Res>
    implements $PremiumStateLoadedCopyWith<$Res> {
  _$PremiumStateLoadedCopyWithImpl(this._self, this._then);

  final PremiumStateLoaded _self;
  final $Res Function(PremiumStateLoaded) _then;

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedPlan = null,Object? plans = null,Object? isPremium = null,}) {
  return _then(PremiumStateLoaded(
selectedPlan: null == selectedPlan ? _self.selectedPlan : selectedPlan // ignore: cast_nullable_to_non_nullable
as PremiumPlan,plans: null == plans ? _self._plans : plans // ignore: cast_nullable_to_non_nullable
as List<PlanInfo>,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class PremiumStatePurchasing implements PremiumState {
  const PremiumStatePurchasing({required this.plan});
  

 final  PremiumPlan plan;

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PremiumStatePurchasingCopyWith<PremiumStatePurchasing> get copyWith => _$PremiumStatePurchasingCopyWithImpl<PremiumStatePurchasing>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumStatePurchasing&&(identical(other.plan, plan) || other.plan == plan));
}


@override
int get hashCode {
    return Object.hash(runtimeType,plan);
}

@override
String toString() {
    return 'PremiumState.purchasing(plan: $plan)';
}


}

/// @nodoc
abstract mixin class $PremiumStatePurchasingCopyWith<$Res> implements $PremiumStateCopyWith<$Res> {
  factory $PremiumStatePurchasingCopyWith(PremiumStatePurchasing value, $Res Function(PremiumStatePurchasing) _then) = _$PremiumStatePurchasingCopyWithImpl;
@useResult
$Res call({
 PremiumPlan plan
});




}
/// @nodoc
class _$PremiumStatePurchasingCopyWithImpl<$Res>
    implements $PremiumStatePurchasingCopyWith<$Res> {
  _$PremiumStatePurchasingCopyWithImpl(this._self, this._then);

  final PremiumStatePurchasing _self;
  final $Res Function(PremiumStatePurchasing) _then;

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? plan = null,}) {
  return _then(PremiumStatePurchasing(
plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PremiumPlan,
  ));
}


}

/// @nodoc


class PremiumStatePurchaseSuccess implements PremiumState {
  const PremiumStatePurchaseSuccess();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumStatePurchaseSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PremiumState.purchaseSuccess()';
}


}




/// @nodoc


class PremiumStateError implements PremiumState {
  const PremiumStateError({required this.message});
  

 final  String message;

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PremiumStateErrorCopyWith<PremiumStateError> get copyWith => _$PremiumStateErrorCopyWithImpl<PremiumStateError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'PremiumState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PremiumStateErrorCopyWith<$Res> implements $PremiumStateCopyWith<$Res> {
  factory $PremiumStateErrorCopyWith(PremiumStateError value, $Res Function(PremiumStateError) _then) = _$PremiumStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PremiumStateErrorCopyWithImpl<$Res>
    implements $PremiumStateErrorCopyWith<$Res> {
  _$PremiumStateErrorCopyWithImpl(this._self, this._then);

  final PremiumStateError _self;
  final $Res Function(PremiumStateError) _then;

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PremiumStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
