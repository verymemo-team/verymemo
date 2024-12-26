import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackgroundShellScaffold extends StatefulWidget {
  final GoRouterState state;
  final StatefulNavigationShell navigationShell;
  const BackgroundShellScaffold({
    super.key,
    required this.state,
    required this.navigationShell,
  });

  @override
  State<BackgroundShellScaffold> createState() =>
      _BackgroundShellScaffoldState();
}

class _BackgroundShellScaffoldState extends State<BackgroundShellScaffold> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
