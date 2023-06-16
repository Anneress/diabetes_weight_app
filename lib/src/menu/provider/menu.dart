// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diabetes_weight_app/src/menu/domain/menu_entry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuProvider = StateNotifierProvider<Menu, List<MenuEntry>>((ref) {
  return Menu();
});

class Menu extends StateNotifier<List<MenuEntry>> {
  Menu() : super(const []);

  void add(MenuEntry entry) {
    state = [...state, entry];
  }

  void remove(MenuEntry entry) {
    state = state.where((element) => element != entry).toList();
  }

  void update(MenuEntry old, MenuEntry entry) {
    state = state.map((e) => e == old ? entry : e).toList();
  }

  void clear() {
    state = [];
  }
}

final menuTotalCarbsProvider = Provider<double?>((ref) {
  final entries = ref.watch(menuProvider);

  if (entries.isEmpty) {
    return null;
  }
  num sum = 0;
  for (var element in entries) {
    sum += element.carbs ?? 0;
  }
  return sum.toDouble();
});

final menuTotalWeightProvider = Provider<double?>((ref) {
  final entries = ref.watch(menuProvider);

  if (entries.isEmpty) {
    return null;
  }
  num sum = 0;
  for (var element in entries) {
    sum += element.portionSizeInGram;
  }
  return sum.toDouble();
});
