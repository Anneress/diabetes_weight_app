import 'package:diabetes_weight_app/src/menu/domain/menu_entry.dart';
import 'package:diabetes_weight_app/src/products/domain/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('teste ob Kohlenhydrate richtig berechnet werden', () {
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
}
