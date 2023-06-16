import 'dart:convert';

import 'package:diabetes_weight_app/src/products/domain/category.dart';

class Product extends Category {
  final double? carbs;
  final double? averagePortionSize;

  Product({
    required super.id,
    required super.name,
    required this.carbs,
    required this.averagePortionSize,
    required super.categoryId,
  });

  @override
  Product copyWith({
    String? id,
    String? name,
    double? carbs,
    double? averagePortionSize,
    String? categoryId,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      carbs: carbs ?? this.carbs,
      averagePortionSize: averagePortionSize ?? this.averagePortionSize,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'carbs': carbs,
      'averagePortionSize': averagePortionSize,
      'categoryId': categoryId,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      carbs: (((map['carbs'] as num?)?.toDouble()) ?? 0) /
          1000, // mg to gram / 100g
      averagePortionSize: (map['averagePortionSize'] as num?)?.toDouble(),
      categoryId: map['categoryId'] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, carbs: $carbs, averagePortionSize: $averagePortionSize, categoryId: $categoryId)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.carbs == carbs &&
        other.averagePortionSize == averagePortionSize &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        carbs.hashCode ^
        averagePortionSize.hashCode ^
        categoryId.hashCode;
  }
}
