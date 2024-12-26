part of 'router.dart';

abstract class Shell extends StatefulShellRouteData {
  final GlobalKey<NavigatorState> $nativatorKey;
  final Widget Function(BuildContext context, GoRouterState state,
      StatefulNavigationShell navigationShell) shell;
  const Shell({
    required this.$nativatorKey,
    required this.shell,
  });

  @override
  Widget builder(BuildContext context, GoRouterState state,
      StatefulNavigationShell navigationShell) {
    return shell(
      context,
      state,
      navigationShell,
    );
  }
}

abstract class Branch extends StatefulShellBranchData {
  final GlobalKey<NavigatorState> $nativatorKey;
  const Branch({required this.$nativatorKey});
}

abstract class Route extends GoRouteData {
  final String? path;
  final Widget Function(String? path) body;
  const Route({
    required this.body,
    this.path,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return body(path);
  }
}

class AppRoutes {
  AppRoutes._();

  static const splash = "/splash";
  static const intro = "/intro";
  static const permission = "/permission";
  static const login = "/login";
  // join
  // profile
  static const memoHome = "/memo-home";
  // detail
  static const memoWriting = "/memo-writing";
  static const feed = "/feed";
  static const search = "/search";
  // result
  static const seetings = "/seetings";

  /// sync
  /// delete,
}

class NavigatorKey {
  NavigatorKey._();

  static final routerKey = GlobalKey<NavigatorState>(debugLabel: "router_key");

  /// [Shell 키]
  static final backgroundShellKey =
      GlobalKey<NavigatorState>(debugLabel: "background_shell_key");
  static final homeShellKey =
      GlobalKey<NavigatorState>(debugLabel: "home_shell_key");
  static final insideShellKey =
      GlobalKey<NavigatorState>(debugLabel: "inside_shell_key");
  static final menuShellKey =
      GlobalKey<NavigatorState>(debugLabel: "menu_shell_key");

  /// [Branch 키]
  static final introBranchKey =
      GlobalKey<NavigatorState>(debugLabel: "intro_branch_key");

  static final userTouchBranchKey =
      GlobalKey<NavigatorState>(debugLabel: "user_touch_branch_key");

  static final homeNavigationBranchKey =
      GlobalKey<NavigatorState>(debugLabel: "home_navigation_branch_key");

  static final settingsMenuBranchKey =
      GlobalKey<NavigatorState>(debugLabel: "settings_menu_branch_key");

  static final editingNavigationBranchKey =
      GlobalKey<NavigatorState>(debugLabel: "editing_navigation_branch_key");
}
