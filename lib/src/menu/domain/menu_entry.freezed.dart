// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuEntry {
  Product get product;
  double get portionSizeInGram;

  /// Create a copy of MenuEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MenuEntryCopyWith<MenuEntry> get copyWith =>
      _$MenuEntryCopyWithImpl<MenuEntry>(this as MenuEntry, _$identity);

  /// Serializes this MenuEntry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuEntry &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.portionSizeInGram, portionSizeInGram) ||
                other.portionSizeInGram == portionSizeInGram));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, product, portionSizeInGram);

  @override
  String toString() {
    return 'MenuEntry(product: $product, portionSizeInGram: $portionSizeInGram)';
  }
}

/// @nodoc
abstract mixin class $MenuEntryCopyWith<$Res> {
  factory $MenuEntryCopyWith(MenuEntry value, $Res Function(MenuEntry) _then) =
      _$MenuEntryCopyWithImpl;
  @useResult
  $Res call({Product product, double portionSizeInGram});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$MenuEntryCopyWithImpl<$Res> implements $MenuEntryCopyWith<$Res> {
  _$MenuEntryCopyWithImpl(this._self, this._then);

  final MenuEntry _self;
  final $Res Function(MenuEntry) _then;

  /// Create a copy of MenuEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? portionSizeInGram = null,
  }) {
    return _then(_self.copyWith(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      portionSizeInGram: null == portionSizeInGram
          ? _self.portionSizeInGram
          : portionSizeInGram // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of MenuEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _MenuEntry extends MenuEntry {
  const _MenuEntry({required this.product, required this.portionSizeInGram})
      : super._();
  factory _MenuEntry.fromJson(Map<String, dynamic> json) =>
      _$MenuEntryFromJson(json);

  @override
  final Product product;
  @override
  final double portionSizeInGram;

  /// Create a copy of MenuEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MenuEntryCopyWith<_MenuEntry> get copyWith =>
      __$MenuEntryCopyWithImpl<_MenuEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MenuEntryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MenuEntry &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.portionSizeInGram, portionSizeInGram) ||
                other.portionSizeInGram == portionSizeInGram));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, product, portionSizeInGram);

  @override
  String toString() {
    return 'MenuEntry(product: $product, portionSizeInGram: $portionSizeInGram)';
  }
}

/// @nodoc
abstract mixin class _$MenuEntryCopyWith<$Res>
    implements $MenuEntryCopyWith<$Res> {
  factory _$MenuEntryCopyWith(
          _MenuEntry value, $Res Function(_MenuEntry) _then) =
      __$MenuEntryCopyWithImpl;
  @override
  @useResult
  $Res call({Product product, double portionSizeInGram});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$MenuEntryCopyWithImpl<$Res> implements _$MenuEntryCopyWith<$Res> {
  __$MenuEntryCopyWithImpl(this._self, this._then);

  final _MenuEntry _self;
  final $Res Function(_MenuEntry) _then;

  /// Create a copy of MenuEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
    Object? portionSizeInGram = null,
  }) {
    return _then(_MenuEntry(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      portionSizeInGram: null == portionSizeInGram
          ? _self.portionSizeInGram
          : portionSizeInGram // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of MenuEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

// dart format on
