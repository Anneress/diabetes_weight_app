import 'package:diabetes_weight_app/src/menu/provider/menu.dart';
import 'package:diabetes_weight_app/src/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NutritionalEvaluationWidget extends ConsumerWidget {
  const NutritionalEvaluationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuEntries = ref.watch(menuProvider);
    final rows = menuEntries.map(
      (e) => DataRow(
        cells: [
          DataCell(
            Text(
              e.product.name,
            ),
          ),
          DataCell(
            Text("${e.portionSizeInGram} g"),
          ),
          DataCell(
            Text("${(e.carbs ?? 0).toStringAsFixed(2)} g/100g"),
          ),
        ],
      ),
    );
    print(rows);

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
        color: Theme.of(context).colorScheme.background.withOpacity(0.8),
      ),
      padding: const EdgeInsets.all(defaultSpace),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text("Produkt"),
            ),
            DataColumn(
              label: Text("Gewicht"),
            ),
            DataColumn(
              label: Text("KH"),
            ),
          ],
          rows: [
            ...rows,
            DataRow(
              cells: [
                const DataCell(
                  Text("Gesamt"),
                ),
                DataCell(Text(
                  "${(ref.watch(menuTotalWeightProvider) ?? 0)} g",
                )),
                DataCell(
                  Text(
                      "${(ref.watch(menuTotalCarbsProvider) ?? 0).toStringAsFixed(2)} g/100g"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
