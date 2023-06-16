import 'dart:io';
import 'package:diabetes_weight_app/src/sqlite/bls_products_key.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

final sqliteDbProvider = FutureProvider<Database>((ref) async {
  var databasesPath = await getDatabasesPath();
  var path = join(databasesPath, "bls_products.sqlite");

  if (!await databaseExists(path) || true) {
    await Directory(dirname(path)).create(recursive: true);

    ByteData data =
        await rootBundle.load(join("assets", "bls_products.sqlite"));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    await File(path).writeAsBytes(bytes, flush: true);
  }

  final db = await openDatabase(path, password: blsProductsKey, readOnly: true);

  ref.onDispose(() {
    db.close();
  });

  return db;
});

final dbIsOpenProvider = Provider<bool>(
  (ref) {
    final db = ref.watch(sqliteDbProvider);
    return db.whenData((value) => value.isOpen).value ?? false;
  },
);
