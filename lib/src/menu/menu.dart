// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diabetes_weight_app/src/menu/domain/menu_entry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuProvider = StateNotifierProvider<Menu, List<MenuEntry>>((ref) {
  return Menu(entries: []);
});

class Menu extends StateNotifier<List<MenuEntry>> {
  List<MenuEntry> entries;

  Menu({
    this.entries = const [],
  }) : super(entries);

  void add(MenuEntry entry) {
    entries = [...entries, entry];
  }

  void remove(MenuEntry entry) {
    entries = entries.where((element) => element != entry).toList();
  }

  void update(MenuEntry old, MenuEntry entry) {
    entries = entries.map((e) => e == old ? entry : e).toList();
  }

  double? get totalCarbs {
    if (entries.isEmpty) {
      return null;
    }
    num sum = 0;
    for (var element in entries) {
      sum += element.carbs ?? 0;
    }
    return sum.toDouble();
  }
}
