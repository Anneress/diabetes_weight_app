import 'package:diabetes_weight_app/src/products/domain/category.dart';
import 'package:diabetes_weight_app/src/products/domain/product.dart';
import 'package:diabetes_weight_app/src/products/data/bls_db_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

final productsRepositoryProvider = Provider((ref) {
  final db = ref.watch(blsDbProvider);
  return BlsSqliteProductsRepository(db: db.value);
});

class BlsSqliteProductsRepository implements ProductsRepository {
  final Database? db;

  const BlsSqliteProductsRepository({required this.db});

  @override
  Future<List<Category>?> loadCategorys() async {
    if (db != null && !db!.isOpen) {
      throw Exception("Database is not open");
    }
    final categorys = await db?.query("categorys");
    return categorys
        ?.map(
          (e) => Category.fromMap(e),
        )
        .toList();
  }

  @override
  Future<List<Product>?> findProducts({String? value}) async {
    if (db != null && !db!.isOpen) {
      throw Exception("Database is not open");
    }
    List<Map<String, Object?>>? products;
    if (value == null) {
      products = await db?.query("products", limit: 100, orderBy: 'name');
    } else {
      final words = value.split(" ");
      // Search for multiple words ignoring order
      final wordsInst = words.map((e) => 'instr(lower("name"), lower(?)) > 0');
      products = await db?.query(
        "products",
        where: wordsInst.join(' and '),
        whereArgs: words,
        limit: 100,
        orderBy: 'name',
      );
    }
    return products?.map((e) => Product.fromMap(e)).toList();
  }
}

abstract class ProductsRepository {
  Future<List<Category>?> loadCategorys();
  Future<List<Product>?> findProducts({String? value});
}
