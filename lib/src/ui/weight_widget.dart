import 'package:diabetes_weight_app/src/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeightWidget extends ConsumerWidget {
  const WeightWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pushNamed("/products"),
          icon: const Icon(Icons.add),
        ),
        const SizedBox(
          height: defaultSpace,
        ),
        Flexible(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: defaultBorderWidth,
                color: defaultBorderColor,
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(defaultRadius),
              ),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(smallSpace),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 4,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: const Border.symmetric(
                  vertical: BorderSide(
                    width: defaultBorderWidth,
                    color: defaultBorderColor,
                  ),
                ),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: defaultBorderWidth,
                color: defaultBorderColor,
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(defaultRadius),
              ),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(defaultSpace),
            child: Row(
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Waage Nullwert tarieren"),
                        ),
                      ),
                      icon: const Text("T"),
                    ),
                  ],
                ),
                const SizedBox(
                  width: smallSpace,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(defaultRadius)),
                      color: Colors.amber.shade100.withOpacity(0.8),
                    ),
                    padding: const EdgeInsets.all(smallSpace),
                    alignment: Alignment.centerRight,
                    child: const Text(
                      "0 g",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                ),
                const SizedBox(
                  width: smallSpace,
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Wert als Portion in Menü übernehmen."),
                        ),
                      ),
                      icon: const Icon(Icons.check),
                      color: Colors.teal.shade400,
                    ),
                    const SizedBox(
                      height: smallSpace,
                    ),
                    IconButton(
                      onPressed: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Wert manuell eingeben"),
                        ),
                      ),
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
