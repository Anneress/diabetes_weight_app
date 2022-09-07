import 'package:diabetes_weight_app/src/app.dart';
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
      body: Column(
        children: [
          DropdownButton(
            value: ref.watch(themeModeProvider.state).state ?? ThemeMode.system,
            items: ThemeMode.values
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name),
                  ),
                )
                .toList(),
            onChanged: (value) =>
                ref.read(themeModeProvider.state).state = value,
          ),
        ],
      ),
    );
  }
}
