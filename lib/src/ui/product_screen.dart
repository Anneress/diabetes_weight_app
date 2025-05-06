import 'package:diabetes_weight_app/src/menu/provider/menu.dart';
import 'package:diabetes_weight_app/src/products/presentation/product_screen_controller.dart';
import 'package:diabetes_weight_app/src/style_constants.dart';
import 'package:diabetes_weight_app/src/ui/change_portion_size_dialog.dart';
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
      body: Column(
        children: [
          Expanded(
            child: controller.when(
              data: (data) {
                if (data != null) {
                  return Padding(
                    padding: const EdgeInsets.all(defaultSpace),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => Card(
                        child: ListTile(
                          onTap: () {
                            //TODO
                          },
                          trailing: const Icon(Icons.add),
                          title: Text(
                            data[index].name,
                          ),
                          subtitle: Wrap(
                            spacing: defaultSpace,
                            children: [
                              Text(
                                "Portion: ${data[index].averagePortionSize} g",
                              ),
                              Text(
                                "KH: ${data[index].carbs?.toStringAsFixed(2)} g/100g",
                              ),
                            ],
                          ),
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
          Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5),
            padding: const EdgeInsets.only(
              left: defaultSpace,
              top: largeSpace,
              right: defaultSpace,
              bottom: defaultSpace,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(defaultRadius),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.search_rounded),
                    hintText: "Was wirst du essen?",
                    //border: OutlineInputBorder(),
                  ),
                  controller: searchTextController,
                  onChanged: (value) {
                    ref
                        .read(productScreenControllerProvider.notifier)
                        .findProducts(value: value);
                  },
                ),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 0,
                    itemBuilder: (context, index) {
                      // final entry = ref.watch(cardProvider)[index];
                      return ListTile(
                        leadingAndTrailingTextStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                        titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                        leading: IconButton(
                          icon: const Icon(Icons.delete_rounded),
                          onPressed: null // () => ref.read(cardProvider.notifier).remove(entry),
                        ),
                        title: Text(
                          "TODO", // entry.product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "TODO",//"${entry.portionSizeInGram} g",
                            ),
                            IconButton(
                              onPressed: () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  isDismissible: true,
                                  showDragHandle: true,
                                  context: context,
                                  builder: (context) => ChangePortionSizeDialog(
                                    menuEntryIndex: index,
                                    menuProvider: menuProvider,
                                  ),
                                );
                              },
                              icon: const Icon(Icons.edit_rounded),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
