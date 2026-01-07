# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Flutter/Dart mobile app for diabetes carbohydrate calculation. Calculates carbs per food portion based on manual weight input or Bluetooth scale readings. Primary target: iOS, secondary: Android.

## Build & Development Commands

```bash
# Development
fvm flutter run                                              # Run app
fvm flutter analyze                                          # Lint (run before commits)
fvm flutter test                                             # Run all tests
fvm flutter test test/path/to/test_file.dart                 # Single test file

# Build
fvm flutter build apk --release                              # Android APK
fvm flutter build ios --release                              # iOS

# Code generation (after modifying Freezed models)
fvm dart run build_runner build --delete-conflicting-outputs

# Formatting
fvm dart format .
```

**Flutter version**: 3.32.2 (managed via FVM in `.fvm/`)

## Architecture

### Layered Structure (Clean Architecture)

```
lib/src/
├── menu/           # Menu management feature
│   ├── domain/     # MenuEntry model (Freezed)
│   └── provider/   # MenuNotifier (Riverpod StateNotifierProvider)
├── products/       # Product catalog feature
│   ├── domain/     # Product, Category, Favourite models (Freezed)
│   ├── data/       # Repositories, database clients
│   └── presentation/  # ProductScreenController
└── ui/             # Screens and widgets
```

### State Management (Riverpod)

- `StateNotifierProvider` for mutable state with notifiers (`menuProvider`, `productScreenControllerProvider`)
- `Provider` for computed/derived values (`menuTotalCarbsProvider`, `menuTotalWeightProvider`)
- `FutureProvider` for async data loading (`blsDbProvider`, `categoriesProvider`)
- Use `ConsumerWidget` for widgets that access providers
- Use `ref.watch()` for reactive updates, `ref.read()` for one-time access

### Data Persistence (SQLCipher)

Two encrypted databases:
1. **BLS Database** (read-only): Pre-built product database bundled in `assets/bls_products.sqlite`, encrypted with `BLSPRODUCTSKEY` env var
2. **User Database** (read-write): User-specific data (favourites, custom entries)

Database providers: `bls_db_client_provider.dart`, `user_db_client_provider.dart`

### Data Models

All models use Freezed for immutability with JSON serialization:
```dart
@freezed
abstract class Product with _$Product {
  const factory Product({...}) = _Product;
  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
```

Key model: `MenuEntry` has a calculated `carbs` property based on `product.carbs * portionSizeInGram / 100`

## Code Style

- **Line length**: 80 characters max
- **Imports**: Relative imports for local files, grouped (Dart/Flutter → third-party → local)
- **Naming**: PascalCase (classes), camelCase (methods/variables), UPPER_SNAKE_CASE (constants), snake_case (files), `_` prefix (private)
- **Design constants**: Use values from `style_constants.dart` (`defaultSpace`, `smallSpace`, `largeSpace`, `defaultRadius`)

## Testing

- Framework: `flutter_test` with Mockito for mocks
- Pattern: Arrange-Act-Assert
- Test domain logic (carb calculations) and providers
- Descriptive test names: `'should calculate carbs correctly when product has carbs'`
