part of 'router.dart';

/// [Shell]
class BackgroundShell extends Shell {
  BackgroundShell()
      : super(
          $nativatorKey: NavigatorKey.backgroundShellKey,
          shell: (context, state, navigationShell) => BackgroundShellScaffold(
            state: state,
            navigationShell: navigationShell,
          ),
        );
}

class HomeShell extends Shell {
  HomeShell()
      : super(
          $nativatorKey: NavigatorKey.homeShellKey,
          shell: (context, state, navigationShell) => HomeShellScaffold(
            state: state,
            navigationShell: navigationShell,
          ),
        );
}

class InsideShell extends Shell {
  InsideShell()
      : super(
          $nativatorKey: NavigatorKey.insideShellKey,
          shell: (context, state, navigationShell) => InsideShellScaffold(
            state: state,
            navigationShell: navigationShell,
          ),
        );
}

class MenuShell extends Shell {
  MenuShell()
      : super(
          $nativatorKey: NavigatorKey.menuShellKey,
          shell: (context, state, navigationShell) => MenuShellScaffold(
            state: state,
            navigationShell: navigationShell,
          ),
        );
}

/// [Branch]
/// [IntroShell]
class IntroBranch extends Branch {
  IntroBranch() : super($nativatorKey: NavigatorKey.introBranchKey);
}

class UserTouchBranch extends Branch {
  UserTouchBranch() : super($nativatorKey: NavigatorKey.userTouchBranchKey);
}

/// [HomeShell]
class HomeNavigationBranch extends Branch {
  HomeNavigationBranch()
      : super($nativatorKey: NavigatorKey.homeNavigationBranchKey);
}

/// [MenuShell]
class SettingsMenuBranch extends Branch {
  SettingsMenuBranch()
      : super($nativatorKey: NavigatorKey.settingsMenuBranchKey);
}

/// [InsideShell]
class EditingNavigationBranch extends Branch {
  EditingNavigationBranch()
      : super($nativatorKey: NavigatorKey.editingNavigationBranchKey);
}

/// [Route]
/// [Splash]
// class SplashRoute extends Route {
//   SplashRoute() : super(body: const SplashView());
// }
