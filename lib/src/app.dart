import 'package:diabetes_weight_app/src/ui/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ui/home.dart';

final themeModeProvider = StateProvider<ThemeMode?>(
  (ref) => ThemeMode.system,
);

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 20, 231, 210),
        ),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/products": (context) => const ProductScreen(),
      },
    );
  }
}
