import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeShellScaffold extends StatefulWidget {
  final GoRouterState state;
  final StatefulNavigationShell navigationShell;
  const HomeShellScaffold({
    super.key,
    required this.state,
    required this.navigationShell,
  });

  @override
  State<HomeShellScaffold> createState() => _HomeShellScaffoldState();
}

class _HomeShellScaffoldState extends State<HomeShellScaffold> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
