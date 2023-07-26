// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Data class to store a product as favourite with portion size and productId
class Favourite {
  final int productId;
  final double portionSizeInGram;

  Favourite({
    required this.productId,
    required this.portionSizeInGram,
  });

  Favourite copyWith({
    int? productId,
    double? portionSizeInGram,
  }) {
    return Favourite(
      productId: productId ?? this.productId,
      portionSizeInGram: portionSizeInGram ?? this.portionSizeInGram,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'portionSizeInGram': portionSizeInGram,
    };
  }

  factory Favourite.fromMap(Map<String, dynamic> map) {
    return Favourite(
      productId: map['productId'] as int,
      portionSizeInGram: map['portionSizeInGram'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Favourite.fromJson(String source) =>
      Favourite.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Favourite(productId: $productId, portionSizeInGram: $portionSizeInGram)';

  @override
  bool operator ==(covariant Favourite other) {
    if (identical(this, other)) return true;

    return other.productId == productId &&
        other.portionSizeInGram == portionSizeInGram;
  }

  @override
  int get hashCode => productId.hashCode ^ portionSizeInGram.hashCode;
}
