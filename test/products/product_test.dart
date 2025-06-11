import 'package:diabetes_weight_app/src/products/domain/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('product should be created with correct values', () {
    final product = Product.fromJson({
      'id': "1",
      'name': "test",
      'carbs': 1500, // 1.5 grams in mg
      'averagePortionSize': 200,
      'categoryId': "testCategory",
    });

    expect(product.id, "1");
    expect(product.name, "test");
    expect(product.carbs, 1.5);
    expect(product.averagePortionSize, 200);
    expect(product.categoryId, "testCategory");
  });

  test('product should handle null values correctly', () {
    final product = Product.fromJson({
      'id': "2",
      'name': "test2",
      'averagePortionSize': null,
      'categoryId': "testCategory2",
    });

    expect(product.carbs, null);
    expect(product.averagePortionSize, null);
  });

  test('carbs should be calculated correctly if product has carbs', () {
    final product = Product.fromJson({
      'id': "1",
      'name': "test",
      'carbs': 2500, // 2.5 grams in mg
      'averagePortionSize': 100,
      'categoryId': "test",
    });

    expect(product.carbs, 2.5);
  });
}