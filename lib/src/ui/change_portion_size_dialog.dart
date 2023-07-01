import 'package:diabetes_weight_app/src/menu/domain/menu_entry.dart';
import 'package:diabetes_weight_app/src/menu/provider/menu.dart';
import 'package:diabetes_weight_app/src/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class ChangePortionSizeDialog extends ConsumerWidget {
  const ChangePortionSizeDialog({
    super.key,
    required this.menuEntryIndex,
    required this.menuProvider,
  });

  final int menuEntryIndex;
  final StateNotifierProvider<MenuNotifier, List<MenuEntry>> menuProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuEntry = ref.watch(menuProvider)[menuEntryIndex];
    var portionSize = menuEntry.portionSizeInGram;
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
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              menuEntry.product.name,
              maxLines: 3,
            ),
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
              onChanged: (p0) => ref.read(menuProvider.notifier).update(
                    menuEntry,
                    menuEntry.copyWith(
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
                        menuEntry,
                        menuEntry.copyWith(
                          portionSizeInGram:
                              menuEntry.product.averagePortionSize,
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
  }
}
