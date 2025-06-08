// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diabetes_weight_app/src/menu/domain/menu_entry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuProvider =
    StateNotifierProvider<MenuNotifier, List<MenuEntry>>((ref) {
  return MenuNotifier();
});

class MenuNotifier extends StateNotifier<List<MenuEntry>> {
  MenuNotifier() : super(const []);

  void add(MenuEntry entry) {
    state = [...state, entry];
  }

  void addAll(List<MenuEntry> entries) {
    state = [...state, ...entries];
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

final menuTotalCarbsProvider = Provider<double>((ref) {
  final entries = ref.watch(menuProvider);

  if (entries.isEmpty) {
    return 0;
  }
  num sum = 0;
  for (var element in entries) {
    sum += element.carbs;
  }
  return sum.toDouble();
});

final menuTotalWeightProvider = Provider<double>((ref) {
  final entries = ref.watch(menuProvider);

  if (entries.isEmpty) {
    return 0;
  }
  num sum = 0;
  for (var element in entries) {
    sum += element.portionSizeInGram;
  }
  return sum.toDouble();
});
