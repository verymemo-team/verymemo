import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:verymemo/common/ui/common/app_theme.dart';
import 'package:verymemo/routers/router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(
        debugLabel: "scaffold_key",
      ),
      routerConfig: router.config,
      theme: ThemeData(
        textTheme: textTheme(context),
        inputDecorationTheme: inputDecorationTheme(context),
        colorScheme: lightThemeColors(context),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        textTheme: textTheme(context),
        inputDecorationTheme: inputDecorationTheme(context),
        colorScheme: darkThemeColors(context),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
    );
  }
}
