import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:diabetes_weight_app/src/products/domain/product.dart';

part 'menu_entry.freezed.dart';
part 'menu_entry.g.dart';

@freezed
abstract class MenuEntry with _$MenuEntry {
  
  const MenuEntry._();

  const factory MenuEntry({
    required Product product,
    required double portionSizeInGram,
  }) = _MenuEntry;

  factory MenuEntry.fromJson(Map<String, Object?> json) =>
      _$MenuEntryFromJson(json);

  double get carbs =>
      product.carbs != null
          ? product.carbs! / 100 * portionSizeInGram
          : 0;
}
