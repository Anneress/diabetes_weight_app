import 'package:diabetes_weight_app/src/menu/domain/menu_entry.dart';
import 'package:diabetes_weight_app/src/products/domain/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('carbs should be calculated correct if product has carbs', () {
    final product = Product(
      id: "1",
      name: "test",
      carbs: 10,
      averagePortionSize: 100,
      categoryId: "test",
    );

    final entry = MenuEntry(product: product, portionSizeInGram: 100);

    expect(entry.carbs, 10);
  });

  test('carbs should be 0 if product has no carbs', () {
    final product = Product(
      id: "1",
      name: "test",
      averagePortionSize: 100,
      categoryId: "test",
    );

    final entry = MenuEntry(product: product, portionSizeInGram: 100);

    expect(entry.carbs, 0);
  });
}
