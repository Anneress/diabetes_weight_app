import 'package:diabetes_weight_app/src/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NutritionalEvaluationWidget extends ConsumerWidget {
  const NutritionalEvaluationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
        color: Theme.of(context).colorScheme.primary,
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
            DataColumn(
              label: Text("ZU"),
            ),
          ],
          rows: const [
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Auswahl treffen",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataCell(
                  Text(""),
                ),
                DataCell(
                  Text(""),
                ),
                DataCell(
                  Text(""),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Gesamt",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    "0 g",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    "0 g",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    "0 g",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
