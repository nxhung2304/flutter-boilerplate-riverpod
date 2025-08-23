// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExampleParams {

 String get title; String? get description; String? get time; DateTime? get date;@JsonKey(name: 'due_date') String? get dueDate;@JsonKey(name: 'category_id') int? get categoryId;
/// Create a copy of ExampleParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExampleParamsCopyWith<ExampleParams> get copyWith => _$ExampleParamsCopyWithImpl<ExampleParams>(this as ExampleParams, _$identity);

  /// Serializes this ExampleParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExampleParams&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.time, time) || other.time == time)&&(identical(other.date, date) || other.date == date)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,time,date,dueDate,categoryId);

@override
String toString() {
  return 'ExampleParams(title: $title, description: $description, time: $time, date: $date, dueDate: $dueDate, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $ExampleParamsCopyWith<$Res>  {
  factory $ExampleParamsCopyWith(ExampleParams value, $Res Function(ExampleParams) _then) = _$ExampleParamsCopyWithImpl;
@useResult
$Res call({
 String title, String? description, String? time, DateTime? date,@JsonKey(name: 'due_date') String? dueDate,@JsonKey(name: 'category_id') int? categoryId
});




}
/// @nodoc
class _$ExampleParamsCopyWithImpl<$Res>
    implements $ExampleParamsCopyWith<$Res> {
  _$ExampleParamsCopyWithImpl(this._self, this._then);

  final ExampleParams _self;
  final $Res Function(ExampleParams) _then;

/// Create a copy of ExampleParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = freezed,Object? time = freezed,Object? date = freezed,Object? dueDate = freezed,Object? categoryId = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExampleParams].
extension ExampleParamsPatterns on ExampleParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExampleParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExampleParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExampleParams value)  $default,){
final _that = this;
switch (_that) {
case _ExampleParams():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExampleParams value)?  $default,){
final _that = this;
switch (_that) {
case _ExampleParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? description,  String? time,  DateTime? date, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'category_id')  int? categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExampleParams() when $default != null:
return $default(_that.title,_that.description,_that.time,_that.date,_that.dueDate,_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? description,  String? time,  DateTime? date, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'category_id')  int? categoryId)  $default,) {final _that = this;
switch (_that) {
case _ExampleParams():
return $default(_that.title,_that.description,_that.time,_that.date,_that.dueDate,_that.categoryId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? description,  String? time,  DateTime? date, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'category_id')  int? categoryId)?  $default,) {final _that = this;
switch (_that) {
case _ExampleParams() when $default != null:
return $default(_that.title,_that.description,_that.time,_that.date,_that.dueDate,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExampleParams implements ExampleParams {
  const _ExampleParams({required this.title, this.description, this.time, this.date, @JsonKey(name: 'due_date') this.dueDate, @JsonKey(name: 'category_id') this.categoryId});
  factory _ExampleParams.fromJson(Map<String, dynamic> json) => _$ExampleParamsFromJson(json);

@override final  String title;
@override final  String? description;
@override final  String? time;
@override final  DateTime? date;
@override@JsonKey(name: 'due_date') final  String? dueDate;
@override@JsonKey(name: 'category_id') final  int? categoryId;

/// Create a copy of ExampleParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExampleParamsCopyWith<_ExampleParams> get copyWith => __$ExampleParamsCopyWithImpl<_ExampleParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExampleParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExampleParams&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.time, time) || other.time == time)&&(identical(other.date, date) || other.date == date)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,time,date,dueDate,categoryId);

@override
String toString() {
  return 'ExampleParams(title: $title, description: $description, time: $time, date: $date, dueDate: $dueDate, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$ExampleParamsCopyWith<$Res> implements $ExampleParamsCopyWith<$Res> {
  factory _$ExampleParamsCopyWith(_ExampleParams value, $Res Function(_ExampleParams) _then) = __$ExampleParamsCopyWithImpl;
@override @useResult
$Res call({
 String title, String? description, String? time, DateTime? date,@JsonKey(name: 'due_date') String? dueDate,@JsonKey(name: 'category_id') int? categoryId
});




}
/// @nodoc
class __$ExampleParamsCopyWithImpl<$Res>
    implements _$ExampleParamsCopyWith<$Res> {
  __$ExampleParamsCopyWithImpl(this._self, this._then);

  final _ExampleParams _self;
  final $Res Function(_ExampleParams) _then;

/// Create a copy of ExampleParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = freezed,Object? time = freezed,Object? date = freezed,Object? dueDate = freezed,Object? categoryId = freezed,}) {
  return _then(_ExampleParams(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
