// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Favourite {
  int get productId;
  double get portionSizeInGram;

  /// Create a copy of Favourite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavouriteCopyWith<Favourite> get copyWith =>
      _$FavouriteCopyWithImpl<Favourite>(this as Favourite, _$identity);

  /// Serializes this Favourite to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Favourite &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.portionSizeInGram, portionSizeInGram) ||
                other.portionSizeInGram == portionSizeInGram));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, portionSizeInGram);

  @override
  String toString() {
    return 'Favourite(productId: $productId, portionSizeInGram: $portionSizeInGram)';
  }
}

/// @nodoc
abstract mixin class $FavouriteCopyWith<$Res> {
  factory $FavouriteCopyWith(Favourite value, $Res Function(Favourite) _then) =
      _$FavouriteCopyWithImpl;
  @useResult
  $Res call({int productId, double portionSizeInGram});
}

/// @nodoc
class _$FavouriteCopyWithImpl<$Res> implements $FavouriteCopyWith<$Res> {
  _$FavouriteCopyWithImpl(this._self, this._then);

  final Favourite _self;
  final $Res Function(Favourite) _then;

  /// Create a copy of Favourite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? portionSizeInGram = null,
  }) {
    return _then(_self.copyWith(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      portionSizeInGram: null == portionSizeInGram
          ? _self.portionSizeInGram
          : portionSizeInGram // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Favourite implements Favourite {
  const _Favourite({required this.productId, required this.portionSizeInGram});
  factory _Favourite.fromJson(Map<String, dynamic> json) =>
      _$FavouriteFromJson(json);

  @override
  final int productId;
  @override
  final double portionSizeInGram;

  /// Create a copy of Favourite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FavouriteCopyWith<_Favourite> get copyWith =>
      __$FavouriteCopyWithImpl<_Favourite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FavouriteToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Favourite &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.portionSizeInGram, portionSizeInGram) ||
                other.portionSizeInGram == portionSizeInGram));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, portionSizeInGram);

  @override
  String toString() {
    return 'Favourite(productId: $productId, portionSizeInGram: $portionSizeInGram)';
  }
}

/// @nodoc
abstract mixin class _$FavouriteCopyWith<$Res>
    implements $FavouriteCopyWith<$Res> {
  factory _$FavouriteCopyWith(
          _Favourite value, $Res Function(_Favourite) _then) =
      __$FavouriteCopyWithImpl;
  @override
  @useResult
  $Res call({int productId, double portionSizeInGram});
}

/// @nodoc
class __$FavouriteCopyWithImpl<$Res> implements _$FavouriteCopyWith<$Res> {
  __$FavouriteCopyWithImpl(this._self, this._then);

  final _Favourite _self;
  final $Res Function(_Favourite) _then;

  /// Create a copy of Favourite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? portionSizeInGram = null,
  }) {
    return _then(_Favourite(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      portionSizeInGram: null == portionSizeInGram
          ? _self.portionSizeInGram
          : portionSizeInGram // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
