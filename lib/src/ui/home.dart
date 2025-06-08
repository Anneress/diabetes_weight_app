import 'package:diabetes_weight_app/src/ui/nutritional_evaluation_widget.dart';
import 'package:diabetes_weight_app/src/menu/provider/menu.dart';
import 'package:diabetes_weight_app/src/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: Wrap(
        alignment: WrapAlignment.end,
        spacing: 18,
        children: [
          FloatingActionButton(
            heroTag: "clearMenu",
            onPressed: () => ref.read(menuProvider.notifier).clear(),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: const Icon(Icons.restart_alt_rounded),
          ),
          FloatingActionButton(
            heroTag: "addProduct",
            onPressed: () => Navigator.of(context).pushNamed("/products"),
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFA8E063), // Frisches Grün
                  Color(0xFFFFD200), // Warmes Orange
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultSpace),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Spacer(),
                      Container(
                        decoration: ShapeDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: const CircleBorder(),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(largeSpace),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.fastfood_rounded,
                              color: Colors.white
                            ),
                            const SizedBox(height: smallSpace),
                            Text(
                              "${ref.watch(menuTotalCarbsProvider).toStringAsFixed(2)} g"
                                  .padLeft(7, " "),
                              maxLines: 1,
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: smallSpace,
                      ),
                      Container(
                        decoration: ShapeDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          shape: const CircleBorder(),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(defaultSpace),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.scale_rounded, color: Colors.white),
                            Text(
                              "${ref.watch(menuTotalWeightProvider).toStringAsFixed(1).padLeft(5, " ")} g",
                              maxLines: 1,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(flex: 2, child: NutritionalEvaluationWidget()),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
