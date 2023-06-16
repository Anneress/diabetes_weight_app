import 'package:diabetes_weight_app/src/menu/domain/menu_entry.dart';
import 'package:diabetes_weight_app/src/menu/provider/menu.dart';
import 'package:diabetes_weight_app/src/products/presentation/product_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(productScreenControllerProvider);

    return Scaffold(
      appBar: AppBar(
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.filter_alt),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: searchTextController,
              onChanged: (value) {
                ref
                    .read(productScreenControllerProvider.notifier)
                    .findProducts(value: value);
              },
              // TODO: Mehr als ein Wort beheben
            ),
            Expanded(
              child: controller.when(
                data: (data) {
                  if (data != null) {
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => Card(
                        child: ListTile(
                          onTap: null,
                          trailing: IconButton(
                            onPressed: () {
                              ref.read(menuProvider.notifier).add(
                                    MenuEntry(
                                      product: data[index],
                                      portionSizeInGram:
                                          data[index].averagePortionSize ?? 0,
                                    ),
                                  );
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.add),
                          ),
                          title: Text(
                            data[index].name,
                          ),
                          subtitle: Wrap(
                            spacing: 18,
                            children: [
                              Text(
                                "${data[index].averagePortionSize} g",
                              ),
                              Text(
                                "${data[index].carbs?.toStringAsFixed(2)} g/100g",
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: ((error, stackTrace) => Center(
                      child: Text(
                        error.toString(),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
