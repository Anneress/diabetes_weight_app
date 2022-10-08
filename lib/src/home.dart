import 'package:diabetes_weight_app/src/nutritional_evaluation_widget.dart';
import 'package:diabetes_weight_app/src/style_constants.dart';
import 'package:diabetes_weight_app/src/weight_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.scale),
            label: "weight",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "settings",
          ),
        ],
        onTap: (value) => print(value),
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultSpace),
        child: Column(
          children: const [
            Expanded(
              child: NutritionalEvaluationWidget(),
            ),
            SizedBox(
              height: largeSpace,
            ),
            Expanded(
              child: WeightWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
