import 'package:diabetes_weight_app/src/menu/provider/menu.dart';
import 'package:diabetes_weight_app/src/style_constants.dart';
import 'package:diabetes_weight_app/src/ui/change_portion_size_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NutritionalEvaluationWidget extends ConsumerWidget {
  const NutritionalEvaluationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuEntries = ref.watch(menuProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.9),
      ),
      padding: const EdgeInsets.all(defaultSpace),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          showCheckboxColumn: true,
          columnSpacing: smallSpace,
          horizontalMargin: smallSpace,
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
          rows: menuEntries.isEmpty
              ? [
                  const DataRow(
                    cells: [
                      DataCell(Text("Was willst du essen?")),
                      DataCell.empty,
                      DataCell.empty
                    ],
                  ),
                ]
              : menuEntries
                  .map(
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
                            isScrollControlled: true,
                            isDismissible: true,
                            showDragHandle: true,
                            context: context,
                            builder: (context) => ChangePortionSizeDialog(
                              menuEntryIndex: menuEntries.indexOf(e),
                              menuProvider: menuProvider,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            "${e.carbs.toStringAsFixed(2)} g",
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
