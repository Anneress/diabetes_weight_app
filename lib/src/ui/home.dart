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
            child: const Icon(Icons.restart_alt_rounded),
          ),
          FloatingActionButton(
            heroTag: "addProduct",
            onPressed: () => Navigator.of(context).pushNamed("/products"),
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/background/top-view-of-immunity-boosting-foods-with-vegetables-and-fish.jpg",
                ),
                fit: BoxFit.cover,
                opacity: 0.5,
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
                          color: Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(0.9),
                          shape: const CircleBorder(),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(largeSpace),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.fastfood_rounded),
                            const SizedBox(height: smallSpace),
                            Text(
                              "${(ref.watch(menuTotalCarbsProvider) ?? 0).toStringAsFixed(2)} g"
                                  .padLeft(7, "0"),
                              maxLines: 1,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: smallSpace,
                      ),
                      Container(
                        decoration: ShapeDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.9),
                          shape: const CircleBorder(),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(defaultSpace),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.scale_rounded),
                            Text(
                              "${(ref.watch(menuTotalWeightProvider) ?? 0).toStringAsFixed(1).padLeft(5, "0")} g",
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodyLarge,
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
