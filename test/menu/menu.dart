import 'package:diabetes_weight_app/src/menu/domain/menu_entry.dart';
import 'package:diabetes_weight_app/src/menu/menu.dart';
import 'package:diabetes_weight_app/src/products/domain/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Add menu entry to empty menu', () {
    final Menu menu = Menu();
    final Product product = Product(
      id: "1",
      name: "test",
      carbs: 0,
      averagePortionSize: 100,
      categoryId: "1",
    );
    final MenuEntry entry = MenuEntry(
      product: product,
      portionSizeInGram: 100,
    );

    menu.add(entry);
    expect(menu.entries, [entry]);
  });

  test('Add different menu entries to menu', () {
    final Product product = Product(
      id: "1",
      name: "test",
      carbs: 0,
      averagePortionSize: 100,
      categoryId: "1",
    );

    final MenuEntry entry = MenuEntry(
      product: product,
      portionSizeInGram: 100,
    );

    final Menu menu = Menu(
      entries: [entry],
    );

    final Product product2 = Product(
      id: "2",
      name: "test2",
      carbs: 0,
      averagePortionSize: 100,
      categoryId: "1",
    );

    final MenuEntry entry2 = MenuEntry(
      product: product2,
      portionSizeInGram: 200,
    );

    menu.add(entry2);

    expect(menu.entries, [entry, entry2]);
  });

  test("add two entries to menu and check totalCarbs", () {
    final Product product = Product(
      id: "1",
      name: "test",
      carbs: 10,
      averagePortionSize: 100,
      categoryId: "1",
    );

    final MenuEntry entry = MenuEntry(
      product: product,
      portionSizeInGram: 100,
    );

    final Menu menu = Menu(
      entries: [entry, entry],
    );

    expect(menu.totalCarbs, 20);
  });
}
