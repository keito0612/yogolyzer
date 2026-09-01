// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryItem {

 String get id; String get imagePath; String get stainType; String get location; String get material; DateTime get createdAt;
/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryItemCopyWith<HistoryItem> get copyWith => _$HistoryItemCopyWithImpl<HistoryItem>(this as HistoryItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HistoryItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.imagePath, _this.imagePath) || other.imagePath == _this.imagePath)&&(identical(other.stainType, _this.stainType) || other.stainType == _this.stainType)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.material, _this.material) || other.material == _this.material)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}


@override
int get hashCode {
  final _this = this as HistoryItem;
  return Object.hash(runtimeType,_this.id,_this.imagePath,_this.stainType,_this.location,_this.material,_this.createdAt);
}

@override
String toString() {
  final _this = this as HistoryItem;
  return 'HistoryItem(id: ${_this.id}, imagePath: ${_this.imagePath}, stainType: ${_this.stainType}, location: ${_this.location}, material: ${_this.material}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $HistoryItemCopyWith<$Res>  {
  factory $HistoryItemCopyWith(HistoryItem value, $Res Function(HistoryItem) _then) = _$HistoryItemCopyWithImpl;
@useResult
$Res call({
 String id, String imagePath, String stainType, String location, String material, DateTime createdAt
});




}
/// @nodoc
class _$HistoryItemCopyWithImpl<$Res>
    implements $HistoryItemCopyWith<$Res> {
  _$HistoryItemCopyWithImpl(this._self, this._then);

  final HistoryItem _self;
  final $Res Function(HistoryItem) _then;

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imagePath = null,Object? stainType = null,Object? location = null,Object? material = null,Object? createdAt = null,}) {
  return _then(HistoryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,stainType: null == stainType ? _self.stainType : stainType // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryItem].
extension HistoryItemPatterns on HistoryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryItem value)  $default,){
final _that = this;
switch (_that) {
case _HistoryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryItem value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String imagePath,  String stainType,  String location,  String material,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
return $default(_that.id,_that.imagePath,_that.stainType,_that.location,_that.material,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String imagePath,  String stainType,  String location,  String material,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _HistoryItem():
return $default(_that.id,_that.imagePath,_that.stainType,_that.location,_that.material,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String imagePath,  String stainType,  String location,  String material,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
return $default(_that.id,_that.imagePath,_that.stainType,_that.location,_that.material,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryItem implements HistoryItem {
  const _HistoryItem({required this.id, required this.imagePath, required this.stainType, required this.location, required this.material, required this.createdAt});
  

@override final  String id;
@override final  String imagePath;
@override final  String stainType;
@override final  String location;
@override final  String material;
@override final  DateTime createdAt;

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryItemCopyWith<_HistoryItem> get copyWith => __$HistoryItemCopyWithImpl<_HistoryItem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.stainType, stainType) || other.stainType == stainType)&&(identical(other.location, location) || other.location == location)&&(identical(other.material, material) || other.material == material)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,imagePath,stainType,location,material,createdAt);
}

@override
String toString() {
    return 'HistoryItem(id: $id, imagePath: $imagePath, stainType: $stainType, location: $location, material: $material, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$HistoryItemCopyWith<$Res> implements $HistoryItemCopyWith<$Res> {
  factory _$HistoryItemCopyWith(_HistoryItem value, $Res Function(_HistoryItem) _then) = __$HistoryItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String imagePath, String stainType, String location, String material, DateTime createdAt
});




}
/// @nodoc
class __$HistoryItemCopyWithImpl<$Res>
    implements _$HistoryItemCopyWith<$Res> {
  __$HistoryItemCopyWithImpl(this._self, this._then);

  final _HistoryItem _self;
  final $Res Function(_HistoryItem) _then;

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imagePath = null,Object? stainType = null,Object? location = null,Object? material = null,Object? createdAt = null,}) {
  return _then(_HistoryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,stainType: null == stainType ? _self.stainType : stainType // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$HistoryGroup {

 String get label; List<HistoryItem> get items;
/// Create a copy of HistoryGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryGroupCopyWith<HistoryGroup> get copyWith => _$HistoryGroupCopyWithImpl<HistoryGroup>(this as HistoryGroup, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HistoryGroup;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryGroup&&(identical(other.label, _this.label) || other.label == _this.label)&&const DeepCollectionEquality().equals(other.items, _this.items));
}


@override
int get hashCode {
  final _this = this as HistoryGroup;
  return Object.hash(runtimeType,_this.label,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as HistoryGroup;
  return 'HistoryGroup(label: ${_this.label}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $HistoryGroupCopyWith<$Res>  {
  factory $HistoryGroupCopyWith(HistoryGroup value, $Res Function(HistoryGroup) _then) = _$HistoryGroupCopyWithImpl;
@useResult
$Res call({
 String label, List<HistoryItem> items
});




}
/// @nodoc
class _$HistoryGroupCopyWithImpl<$Res>
    implements $HistoryGroupCopyWith<$Res> {
  _$HistoryGroupCopyWithImpl(this._self, this._then);

  final HistoryGroup _self;
  final $Res Function(HistoryGroup) _then;

/// Create a copy of HistoryGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? items = null,}) {
  return _then(HistoryGroup(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<HistoryItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryGroup].
extension HistoryGroupPatterns on HistoryGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryGroup value)  $default,){
final _that = this;
switch (_that) {
case _HistoryGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryGroup value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  List<HistoryItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryGroup() when $default != null:
return $default(_that.label,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  List<HistoryItem> items)  $default,) {final _that = this;
switch (_that) {
case _HistoryGroup():
return $default(_that.label,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  List<HistoryItem> items)?  $default,) {final _that = this;
switch (_that) {
case _HistoryGroup() when $default != null:
return $default(_that.label,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryGroup implements HistoryGroup {
  const _HistoryGroup({required this.label, required  List<HistoryItem> items}): _items = items;
  

@override final  String label;
 final  List<HistoryItem> _items;
@override List<HistoryItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of HistoryGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryGroupCopyWith<_HistoryGroup> get copyWith => __$HistoryGroupCopyWithImpl<_HistoryGroup>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryGroup&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.items, _items));
}


@override
int get hashCode {
    return Object.hash(runtimeType,label,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'HistoryGroup(label: $label, items: $items)';
}


}

/// @nodoc
abstract mixin class _$HistoryGroupCopyWith<$Res> implements $HistoryGroupCopyWith<$Res> {
  factory _$HistoryGroupCopyWith(_HistoryGroup value, $Res Function(_HistoryGroup) _then) = __$HistoryGroupCopyWithImpl;
@override @useResult
$Res call({
 String label, List<HistoryItem> items
});




}
/// @nodoc
class __$HistoryGroupCopyWithImpl<$Res>
    implements _$HistoryGroupCopyWith<$Res> {
  __$HistoryGroupCopyWithImpl(this._self, this._then);

  final _HistoryGroup _self;
  final $Res Function(_HistoryGroup) _then;

/// Create a copy of HistoryGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? items = null,}) {
  return _then(_HistoryGroup(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<HistoryItem>,
  ));
}


}

/// @nodoc
mixin _$HistoryState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HistoryState()';
}


}

/// @nodoc
class $HistoryStateCopyWith<$Res>  {
$HistoryStateCopyWith(HistoryState _, $Res Function(HistoryState) __);
}


/// Adds pattern-matching-related methods to [HistoryState].
extension HistoryStatePatterns on HistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HistoryStateLoading value)?  loading,TResult Function( HistoryStateLoaded value)?  loaded,TResult Function( HistoryStateEmpty value)?  empty,TResult Function( HistoryStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HistoryStateLoading() when loading != null:
return loading(_that);case HistoryStateLoaded() when loaded != null:
return loaded(_that);case HistoryStateEmpty() when empty != null:
return empty(_that);case HistoryStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HistoryStateLoading value)  loading,required TResult Function( HistoryStateLoaded value)  loaded,required TResult Function( HistoryStateEmpty value)  empty,required TResult Function( HistoryStateError value)  error,}){
final _that = this;
switch (_that) {
case HistoryStateLoading():
return loading(_that);case HistoryStateLoaded():
return loaded(_that);case HistoryStateEmpty():
return empty(_that);case HistoryStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HistoryStateLoading value)?  loading,TResult? Function( HistoryStateLoaded value)?  loaded,TResult? Function( HistoryStateEmpty value)?  empty,TResult? Function( HistoryStateError value)?  error,}){
final _that = this;
switch (_that) {
case HistoryStateLoading() when loading != null:
return loading(_that);case HistoryStateLoaded() when loaded != null:
return loaded(_that);case HistoryStateEmpty() when empty != null:
return empty(_that);case HistoryStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<HistoryGroup> groups)?  loaded,TResult Function()?  empty,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HistoryStateLoading() when loading != null:
return loading();case HistoryStateLoaded() when loaded != null:
return loaded(_that.groups);case HistoryStateEmpty() when empty != null:
return empty();case HistoryStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<HistoryGroup> groups)  loaded,required TResult Function()  empty,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case HistoryStateLoading():
return loading();case HistoryStateLoaded():
return loaded(_that.groups);case HistoryStateEmpty():
return empty();case HistoryStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<HistoryGroup> groups)?  loaded,TResult? Function()?  empty,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case HistoryStateLoading() when loading != null:
return loading();case HistoryStateLoaded() when loaded != null:
return loaded(_that.groups);case HistoryStateEmpty() when empty != null:
return empty();case HistoryStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class HistoryStateLoading implements HistoryState {
  const HistoryStateLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HistoryState.loading()';
}


}




/// @nodoc


class HistoryStateLoaded implements HistoryState {
  const HistoryStateLoaded({required  List<HistoryGroup> groups}): _groups = groups;
  

 final  List<HistoryGroup> _groups;
 List<HistoryGroup> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}


/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryStateLoadedCopyWith<HistoryStateLoaded> get copyWith => _$HistoryStateLoadedCopyWithImpl<HistoryStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryStateLoaded&&const DeepCollectionEquality().equals(other.groups, _groups));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_groups));
}

@override
String toString() {
    return 'HistoryState.loaded(groups: $groups)';
}


}

/// @nodoc
abstract mixin class $HistoryStateLoadedCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory $HistoryStateLoadedCopyWith(HistoryStateLoaded value, $Res Function(HistoryStateLoaded) _then) = _$HistoryStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<HistoryGroup> groups
});




}
/// @nodoc
class _$HistoryStateLoadedCopyWithImpl<$Res>
    implements $HistoryStateLoadedCopyWith<$Res> {
  _$HistoryStateLoadedCopyWithImpl(this._self, this._then);

  final HistoryStateLoaded _self;
  final $Res Function(HistoryStateLoaded) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? groups = null,}) {
  return _then(HistoryStateLoaded(
groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<HistoryGroup>,
  ));
}


}

/// @nodoc


class HistoryStateEmpty implements HistoryState {
  const HistoryStateEmpty();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryStateEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HistoryState.empty()';
}


}




/// @nodoc


class HistoryStateError implements HistoryState {
  const HistoryStateError({required this.message});
  

 final  String message;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryStateErrorCopyWith<HistoryStateError> get copyWith => _$HistoryStateErrorCopyWithImpl<HistoryStateError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'HistoryState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $HistoryStateErrorCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory $HistoryStateErrorCopyWith(HistoryStateError value, $Res Function(HistoryStateError) _then) = _$HistoryStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$HistoryStateErrorCopyWithImpl<$Res>
    implements $HistoryStateErrorCopyWith<$Res> {
  _$HistoryStateErrorCopyWithImpl(this._self, this._then);

  final HistoryStateError _self;
  final $Res Function(HistoryStateError) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(HistoryStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
