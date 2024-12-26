import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuShellScaffold extends StatefulWidget {
  final GoRouterState state;
  final StatefulNavigationShell navigationShell;
  const MenuShellScaffold({
    super.key,
    required this.state,
    required this.navigationShell,
  });

  @override
  State<MenuShellScaffold> createState() => _MenuShellScaffoldState();
}

class _MenuShellScaffoldState extends State<MenuShellScaffold> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
