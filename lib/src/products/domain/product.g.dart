// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
      id: json['id'] as String,
      name: json['name'] as String,
      carbs: (json['carbs'] as num?)?.toDouble(),
      averagePortionSize: (json['averagePortionSize'] as num?)?.toDouble(),
      categoryId: json['categoryId'] as String,
    );

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'carbs': instance.carbs,
      'averagePortionSize': instance.averagePortionSize,
      'categoryId': instance.categoryId,
    };
