import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    @JsonKey(fromJson: mgToGram) double? carbs,
    double? averagePortionSize,
    required String categoryId,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}

double? mgToGram(num? value) => value == null ? null : value / 1000;
