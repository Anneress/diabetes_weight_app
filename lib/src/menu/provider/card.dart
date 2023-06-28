import 'package:diabetes_weight_app/src/menu/domain/menu_entry.dart';
import 'package:diabetes_weight_app/src/menu/provider/menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardProvider = StateNotifierProvider<MenuNotifier, List<MenuEntry>>(
    (ref) => MenuNotifier());
