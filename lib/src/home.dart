import 'package:diabetes_weight_app/src/app.dart';
import 'package:diabetes_weight_app/src/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Diabetes Kohlenhydrate Rechner",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultSpace),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Placeholder(
                    child: TextFormField(),
                  ),
                ),
                const SizedBox(
                  width: defaultSpace,
                ),
                const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.search),
                ),
              ],
            ),
            Row(
              children: [
                const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove),
                ),
                const SizedBox(
                  width: defaultSpace,
                ),
                Flexible(
                  child: TextFormField(
                    initialValue: "0.00",
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: defaultSpace),
                const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.add),
                ),
                const SizedBox(width: defaultSpace),
                const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.scale),
                ),
              ],
            ),
            const SizedBox(
              height: defaultSpace,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: defaultSpace,
            ),
            Flexible(
              child: DataTable(
                headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  return Theme.of(context).colorScheme.primary;
                }),
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
                    label: Text("Zucker"),
                  ),
                ],
                rows: [
                  const DataRow(
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
                  const DataRow(
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
          ],
        ),
      ),
    );
  }
}
