// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuEntry _$MenuEntryFromJson(Map<String, dynamic> json) => _MenuEntry(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      portionSizeInGram: (json['portionSizeInGram'] as num).toDouble(),
    );

Map<String, dynamic> _$MenuEntryToJson(_MenuEntry instance) =>
    <String, dynamic>{
      'product': instance.product,
      'portionSizeInGram': instance.portionSizeInGram,
    };
