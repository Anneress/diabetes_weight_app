// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
      id: json['id'] as String,
      name: json['name'] as String,
      categoryId: json['categoryId'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categoryId': instance.categoryId,
    };
