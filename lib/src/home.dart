import 'package:diabetes_weight_app/src/menu/presentation/nutritional_evaluation_widget.dart';
import 'package:diabetes_weight_app/src/menu/provider/menu.dart';
import 'package:diabetes_weight_app/src/style_constants.dart';
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
      floatingActionButton: Wrap(
        alignment: WrapAlignment.end,
        spacing: 18,
        children: [
          FloatingActionButton(
            heroTag: "clearMenu",
            onPressed: () => ref.read(menuProvider.notifier).clear(),
            child: const Icon(Icons.restart_alt_rounded),
          ),
          FloatingActionButton(
            heroTag: "addProduct",
            onPressed: () => Navigator.of(context).pushNamed("/products"),
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/background/top-view-of-immunity-boosting-foods-with-vegetables-and-fish.jpg",
                ),
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(defaultSpace),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NutritionalEvaluationWidget(),
                SizedBox(
                  height: largeSpace,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
