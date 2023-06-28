import 'package:diabetes_weight_app/src/menu/provider/menu.dart';
import 'package:diabetes_weight_app/src/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          DataCell(
            Text(
              "${e.portionSizeInGram} g",
              maxLines: 1,
            ),
            showEditIcon: true,
            onTap: () async => await showModalBottomSheet(
                // TODO: Auslagern, sodass auch direkt in Produktauswahl aufrufbar
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  final index = menuEntries.indexOf(e);
                  var portionSize = e.portionSizeInGram;
                  return Padding(
                    padding: EdgeInsets.only(
                      top: defaultSpace,
                      left: defaultSpace,
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      right: defaultSpace,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                e.product.name,
                                maxLines: 3,
                              ),
                            ),
                            const SizedBox(width: defaultSpace),
                            CloseButton(
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: smallSpace,
                          ),
                          child: SpinBox(
                            decimals: 1,
                            min: 0,
                            max: 1000,
                            value: portionSize,
                            onChanged: (p0) =>
                                ref.read(menuProvider.notifier).update(
                                      ref.read(menuProvider)[index],
                                      e.copyWith(
                                        portionSizeInGram: p0,
                                      ),
                                    ),
                          ),
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                ref.read(menuProvider.notifier).update(
                                      ref.read(menuProvider)[index],
                                      e.copyWith(
                                        portionSizeInGram:
                                            e.product.averagePortionSize,
                                      ),
                                    );
                                Navigator.of(context).pop();
                              },
                              child: const Text("Standardwert"),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),
          DataCell(
            Text(
              "${(e.carbs ?? 0).toStringAsFixed(2)} g",
              maxLines: 1,
            ),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
        color: Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.9),
      ),
      padding: const EdgeInsets.all(defaultSpace),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columnSpacing: 18,
          horizontalMargin: 18,
          dividerThickness: 1,
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
                DataCell(
                  Text(
                    "Gesamt",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                DataCell(Text(
                  "${(ref.watch(menuTotalWeightProvider) ?? 0)} g",
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                )),
                DataCell(
                  Text(
                    "${(ref.watch(menuTotalCarbsProvider) ?? 0).toStringAsFixed(2)} g",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 1,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}