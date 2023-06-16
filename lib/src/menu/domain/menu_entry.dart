// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:diabetes_weight_app/src/products/domain/product.dart';

class MenuEntry {
  final Product product;
  final double portionSizeInGram;

  double? get carbs =>
      product.carbs != null && product.averagePortionSize != null
          ? product.carbs! / 100 * portionSizeInGram
          : null;

  MenuEntry({
    required this.product,
    required this.portionSizeInGram,
  });

  MenuEntry copyWith({
    Product? product,
    double? portionSizeInGram,
  }) {
    return MenuEntry(
      product: product ?? this.product,
      portionSizeInGram: portionSizeInGram ?? this.portionSizeInGram,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'portionSizeInGram': portionSizeInGram,
    };
  }

  factory MenuEntry.fromMap(Map<String, dynamic> map) {
    return MenuEntry(
      product: Product.fromMap(map['product'] as Map<String, dynamic>),
      portionSizeInGram: map['portionSizeInGram'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuEntry.fromJson(String source) =>
      MenuEntry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MenuEntry(product: $product, portionSizeInGram: $portionSizeInGram)';

  @override
  bool operator ==(covariant MenuEntry other) {
    if (identical(this, other)) return true;

    return other.product == product &&
        other.portionSizeInGram == portionSizeInGram;
  }

  @override
  int get hashCode => product.hashCode ^ portionSizeInGram.hashCode;
}
