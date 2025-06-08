import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite.freezed.dart';
part 'favourite.g.dart';

@freezed
abstract class Favourite with _$Favourite {
  const factory Favourite({
    required int productId,
    required double portionSizeInGram,
  }) = _Favourite;

  factory Favourite.fromJson(Map<String, Object?> json) =>
      _$FavouriteFromJson(json);
}
