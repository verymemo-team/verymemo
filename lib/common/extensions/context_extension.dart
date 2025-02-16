import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension ContextExtension on BuildContext {
  /// 1. [Navigation / Route]
  void pushNamed(
    String routeName, {
    Map<String, String>? pathParameters,
    Map<String, String>? queryParameters,
  }) {
    // Navigator.pushNamed(this, routeName, arguments: arguments);
    GoRouter.of(this).pushNamed(
      routeName,
      pathParameters: pathParameters ?? const <String, String>{},
      queryParameters: queryParameters ?? const <String, String>{},
    );
  }

  void pushReplacementNamed(
    String routeName, {
    Map<String, String>? pathParameters,
    Map<String, String>? queryParameters,
  }) {
    // Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
    GoRouter.of(this).pushReplacementNamed(
      routeName,
      pathParameters: pathParameters ?? const <String, String>{},
      queryParameters: queryParameters ?? const <String, String>{},
    );
  }

  void pop([bool? result]) {
    if (GoRouter.of(this).canPop()) {
      GoRouter.of(this).pop(result ?? true);
    }
  }

  Uri get currentPath => GoRouter.of(this).routeInformationProvider.value.uri;

  /// 2. [Padding / Margin / Size]
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  Size get size => MediaQuery.of(this).size;

  /// 3. [Theme]
  ThemeData get theme => Theme.of(this);
  ColorScheme get scheme => theme.colorScheme;
}
