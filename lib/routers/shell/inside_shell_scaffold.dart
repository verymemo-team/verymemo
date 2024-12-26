import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class InsideShellScaffold extends StatefulWidget {
  final GoRouterState state;
  final StatefulNavigationShell navigationShell;
  const InsideShellScaffold({
    super.key,
    required this.state,
    required this.navigationShell,
  });

  @override
  State<InsideShellScaffold> createState() => _InsideShellScaffoldState();
}

class _InsideShellScaffoldState extends State<InsideShellScaffold> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
