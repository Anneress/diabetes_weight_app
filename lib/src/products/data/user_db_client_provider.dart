import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

final userDbClientProvider = FutureProvider((ref) async {
  late final Database db;
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, "user.db");

  if (!await databaseExists(path)) {
    await Directory(dirname(path)).create(recursive: true);
    db = await openDatabase(path);
    await db.execute(
      "CREATE TABLE favourites (id INTEGER PRIMARY KEY, productId INTEGER, portionSizeInGram REAL)",
    );
  } else {
    db = await openDatabase(path);
  }

  ref.onDispose(() {
    db.close();
  });

  return db;
});

final userDbClientIsOpenProvider = Provider<bool>(
  (ref) {
    final db = ref.watch(userDbClientProvider);
    return db.whenData((value) => value.isOpen).value ?? false;
  },
);
