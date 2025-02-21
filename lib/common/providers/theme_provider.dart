import 'package:flutter/material.dart';
import 'package:verymemo/externals/storage/storage_service.dart';

// @riverpod
// class ThemeNotifier extends _$ThemeNotifier {
//   @override
//   ThemeMode build() {
//     _loadThemeMode();
//     return ThemeMode.light;
//   }

//   void toggleTheme() {
//     if (state == ThemeMode.light) {
//       state = ThemeMode.dark;
//     } else {
//       state = ThemeMode.light;
//     }
//   }

//   Future<void> _loadThemeMode() async {
//     final storage = ref.watch(storageProvider);
//     final themeIndex = await storage.get(key: "themeMode") ?? "1";
//     state = ThemeMode.values[int.tryParse(themeIndex.toString()) ?? 1];
//   }

//   Future<void> saveThemeMode(ThemeMode mode) async {
//     final storage = ref.watch(storageProvider);
//     await storage.set(key: "themeMode", data: mode.index);
//   }
// }
