import 'package:diabetes_weight_app/src/products/domain/favourite.dart';

abstract class FavouritesRepository {
  Future<List<Favourite>?> findFavourites({String? value});
  Future<void> storeFavourite(Favourite favourite);
  Future<void> deleteFavourite(int id);
}
