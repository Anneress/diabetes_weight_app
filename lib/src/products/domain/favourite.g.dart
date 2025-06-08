// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Favourite _$FavouriteFromJson(Map<String, dynamic> json) => _Favourite(
      productId: (json['productId'] as num).toInt(),
      portionSizeInGram: (json['portionSizeInGram'] as num).toDouble(),
    );

Map<String, dynamic> _$FavouriteToJson(_Favourite instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'portionSizeInGram': instance.portionSizeInGram,
    };
