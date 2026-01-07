# AGENTS.md - Diabetes Weight App

You are an expert Flutter/Dart developer for a diabetes carbohydrate calculation app using Riverpod, Freezed, and encrypted SQLite storage.

## Build/Lint/Test Commands
- **Build APK**: `flutter build apk --release`
- **Build iOS**: `flutter build ios --release`
- **Run app**: `flutter run`
- **Lint**: `flutter analyze`
- **Test all**: `flutter test`
- **Test single**: `flutter test test/path/to/test_file.dart`
- **Generate code**: `dart run build_runner build --delete-conflicting-outputs`

## Code Style Guidelines

### Formatting & Linting
- Line length: 80 characters max
- Use `flutter_lints` package for consistent linting
- Run `flutter analyze` before commits
- Format code with `dart format`

### Imports
- Use relative imports for local files: `import '../domain/product.dart'`
- Group imports: Dart/Flutter → third-party → local
- Remove unused imports (enforced by linter)

### Naming Conventions
- **Classes**: PascalCase (`Product`, `ProductsRepository`)
- **Methods/Functions**: camelCase (`findProducts`, `loadCategories`)
- **Variables**: camelCase (`productName`, `categoryId`)
- **Constants**: UPPER_SNAKE_CASE (`DEFAULT_SPACE`)
- **Files**: snake_case (`product_repository.dart`)
- **Private members**: prefix with `_` (`_counter`)

### Data Classes & Models
- Use Freezed for immutable models: `@freezed abstract class Product`
- Include JSON serialization: `factory Product.fromJson(Map<String, dynamic> json)`
- Use `const factory` constructors
- Add custom JSON converters for complex types

### State Management (Riverpod)
- Use Riverpod for dependency injection and state management
- Create providers ending in `Provider`: `final productsProvider = Provider<ProductsRepository>`
- Use `ref.watch()` for reactive updates, `ref.read()` for one-time access
- Prefer `ConsumerWidget` for UI components

### Error Handling
- Use try/catch for async operations
- Throw descriptive custom exceptions
- Validate database state before operations
- Use `Result<T>` pattern for operations that can fail

### Database (SQLCipher + Sqflite)
- Use encrypted storage with `sqflite_sqlcipher`
- Check database connection: `await checkIfDbIsOpen()`
- Use parameterized queries to prevent SQL injection
- Validate data before database operations

### Testing
- Use `flutter_test` framework with Mockito for mocks
- Follow Arrange-Act-Assert pattern
- Write unit tests for domain logic, repositories, and providers
- Use descriptive test names: `'should calculate carbs correctly when product has carbs'`
- Test both success and error scenarios

### UI Guidelines
- Use Material Design 3 components
- Apply consistent spacing from `style_constants.dart`
- Use `Theme.of(context)` for colors and text styles
- Implement responsive layouts with `LayoutBuilder`
- Use `const` constructors for performance

### Architecture
- **Presentation**: UI widgets and screens
- **Domain**: Business logic and entities
- **Data**: Repositories, database clients, API clients
- **Core**: Shared utilities and constants

### Code Quality
- Write concise, readable code (< 20 lines per function)
- Use null safety features, avoid `!` unless guaranteed non-null
- Add doc comments for public APIs: `/// Calculates total carbohydrates for a portion`
- Prefer composition over inheritance for widgets
- Use `async/await` for asynchronous operations