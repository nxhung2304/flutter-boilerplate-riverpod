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
  String get title;

  /// Create a copy of ExampleParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExampleParamsCopyWith<ExampleParams> get copyWith =>
      _$ExampleParamsCopyWithImpl<ExampleParams>(
          this as ExampleParams, _$identity);

  /// Serializes this ExampleParams to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExampleParams &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  @override
  String toString() {
    return 'ExampleParams(title: $title)';
  }
}

/// @nodoc
abstract mixin class $ExampleParamsCopyWith<$Res> {
  factory $ExampleParamsCopyWith(
          ExampleParams value, $Res Function(ExampleParams) _then) =
      _$ExampleParamsCopyWithImpl;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$ExampleParamsCopyWithImpl<$Res>
    implements $ExampleParamsCopyWith<$Res> {
  _$ExampleParamsCopyWithImpl(this._self, this._then);

  final ExampleParams _self;
  final $Res Function(ExampleParams) _then;

  /// Create a copy of ExampleParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ExampleParams value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExampleParams() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ExampleParams value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExampleParams():
        return $default(_that);
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ExampleParams value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExampleParams() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String title)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExampleParams() when $default != null:
        return $default(_that.title);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String title) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExampleParams():
        return $default(_that.title);
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String title)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExampleParams() when $default != null:
        return $default(_that.title);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ExampleParams implements ExampleParams {
  const _ExampleParams({required this.title});
  factory _ExampleParams.fromJson(Map<String, dynamic> json) =>
      _$ExampleParamsFromJson(json);

  @override
  final String title;

  /// Create a copy of ExampleParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExampleParamsCopyWith<_ExampleParams> get copyWith =>
      __$ExampleParamsCopyWithImpl<_ExampleParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExampleParamsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExampleParams &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  @override
  String toString() {
    return 'ExampleParams(title: $title)';
  }
}

/// @nodoc
abstract mixin class _$ExampleParamsCopyWith<$Res>
    implements $ExampleParamsCopyWith<$Res> {
  factory _$ExampleParamsCopyWith(
          _ExampleParams value, $Res Function(_ExampleParams) _then) =
      __$ExampleParamsCopyWithImpl;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$ExampleParamsCopyWithImpl<$Res>
    implements _$ExampleParamsCopyWith<$Res> {
  __$ExampleParamsCopyWithImpl(this._self, this._then);

  final _ExampleParams _self;
  final $Res Function(_ExampleParams) _then;

  /// Create a copy of ExampleParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
  }) {
    return _then(_ExampleParams(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
