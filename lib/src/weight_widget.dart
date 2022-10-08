import 'package:diabetes_weight_app/src/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeightWidget extends ConsumerWidget {
  const WeightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          const FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.add),
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
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(defaultRadius),
                ),
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
                  border: Border.symmetric(
                      vertical: BorderSide(
                    width: defaultBorderWidth,
                    color: defaultBorderColor,
                  )),
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
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(defaultRadius),
                ),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(defaultSpace),
              child: Row(
                children: [
                  const FloatingActionButton(
                    onPressed: null,
                    child: Text("T"),
                  ),
                  const SizedBox(
                    width: smallSpace,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(defaultRadius)),
                        color: Theme.of(context).colorScheme.primary,
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
                  const FloatingActionButton(
                    onPressed: null,
                    child: Icon(Icons.edit),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
