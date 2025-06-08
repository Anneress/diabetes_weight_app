import 'package:diabetes_weight_app/src/products/domain/favourite.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

abstract class FavouritesRepository {
  Future<List<Favourite>?> findFavourites({String? value});
  Future<void> storeFavourite(Favourite favourite);
  Future<void> deleteFavourite(int id);
}

class UserDbFavouritesRepository implements FavouritesRepository {
  final Database? db;
  UserDbFavouritesRepository({required this.db});

  @override
  Future<void> deleteFavourite(int id) async {
    checkIfDbIsOpen();
    final count =
        await db?.delete("favourites", where: 'id = ?', whereArgs: [id]);
    if (count != 1) {
      throw DidNotDeleteFavouriteError(id);
    }
  }

  @override
  Future<List<Favourite>?> findFavourites({String? value}) async {
    checkIfDbIsOpen();
    final res = value != null
        ? await db?.query("favourites", where: 'id = ?', whereArgs: [value])
        : await db?.query("favourites");
    return res?.map((e) => Favourite.fromJson(e)).toList();
  }

  @override
  Future<void> storeFavourite(Favourite favourite) async {
    checkIfDbIsOpen();
    final id = await db?.insert("favourites", favourite.toJson());
    if (id == 0) {
      throw DidNotStoreFavouriteError(favourite);
    }
  }

  void checkIfDbIsOpen() {
    if (db == null || !db!.isOpen) {
      throw const UserDbIsNotOpenError();
    }
  }
}

class UserDbIsNotOpenError implements Exception {
  const UserDbIsNotOpenError();

  @override
  String toString() {
    return "Error: Database is not open";
  }
}

class DidNotDeleteFavouriteError implements Exception {
  final int id;

  const DidNotDeleteFavouriteError(this.id);

  @override
  String toString() {
    return "Error: Did not delete favourite with id: $id";
  }
}

class DidNotStoreFavouriteError implements Exception {
  final Favourite favourite;

  const DidNotStoreFavouriteError(this.favourite);

  @override
  String toString() {
    return "Error: Did not store favourite: $favourite";
  }
}
