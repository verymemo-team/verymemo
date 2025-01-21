import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:verymemo/features/login/login_view.dart';
import 'package:verymemo/core/styles/app_theme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    const ProviderScope(
      child: _App(),
    ),
  );

  FlutterNativeSplash.remove();
}

class _App extends ConsumerWidget {
  const _App();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: lightThemeColors(context), // 라이트 모드 색상 적용
        useMaterial3: true, // Material 3 스타일 사용
      ),
      darkTheme: ThemeData(
        colorScheme: darkThemeColors(context), // 다크 모드 색상 적용
        useMaterial3: true, // Material 3 스타일 사용
      ),
      themeMode: ThemeMode.system, // 시스템의 모드에 맞춰 자동으로 라이트/다크 모드 전환
      home: Scaffold(
        body: LoginView(),
      ),
    );
  }
}
