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
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.92),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ]
      ),
      padding: const EdgeInsets.all(defaultSpace),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          showCheckboxColumn: true,
          columnSpacing: smallSpace,
          horizontalMargin: smallSpace,
          dividerThickness: 2,
          headingRowColor: WidgetStateProperty.all(const Color(0xFFA8E063)), // Frisches Grün
          headingTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
            letterSpacing: 0.5,
          ),
          dataRowColor: WidgetStateProperty.resolveWith<Color?>(
            (states) => states.contains(WidgetState.selected)
                ? const Color(0xFFFFF9C4) // Helles Gelb bei Auswahl
                : Theme.of(context).colorScheme.surface.withValues(alpha: 0.97),
          ),
          dataTextStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 15,
          ),
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
