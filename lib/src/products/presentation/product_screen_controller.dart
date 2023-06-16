import 'package:diabetes_weight_app/src/products/data/products_repository.dart';
import 'package:diabetes_weight_app/src/products/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductScreenController
    extends StateNotifier<AsyncValue<List<Product>?>> {
  ProductScreenController({required this.repository})
      : super(const AsyncLoading());

  final ProductsRepository repository;

  Future<void> findProducts({String? value}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.findProducts(value: value));
  }
}

final productScreenControllerProvider =
    StateNotifierProvider<ProductScreenController, AsyncValue<List<Product>?>>(
        (ref) {
  final repository = ref.watch(productsRepositoryProvider);
  final controller = ProductScreenController(repository: repository);
  controller.findProducts();
  return controller;
});

final categoriesProvider = FutureProvider(
    (ref) => ref.watch(productsRepositoryProvider).loadCategorys());
