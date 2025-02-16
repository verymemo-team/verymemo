part of 'router.dart';

// ✅ 인트로 쉘
class IntroShell extends Shell {
  @override
  GlobalKey<NavigatorState> get shellKey => NavigatorKey.introShellKey;

  @override
  Widget buildScaffold(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      IntroScaffold(
        navigationShell: navigationShell,
        state: state,
      );
}

// ✅ 홈 쉘
class HomeShell extends Shell {
  @override
  GlobalKey<NavigatorState> get shellKey => NavigatorKey.homeShellKey;

  @override
  Widget buildScaffold(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      HomeScaffold(
        navigationShell: navigationShell,
        state: state,
      );
}

// ✅ 디테일 쉘
class DetailShell extends Shell {
  @override
  GlobalKey<NavigatorState> get shellKey => NavigatorKey.detailShellKey;
  @override
  Widget buildScaffold(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      DetailScaffold(
        navigationShell: navigationShell,
        state: state,
      );
}

////////////////////////////////////////////////////////////

// ✅ Intro 브랜치
class IntroBranch extends Branch {
  @override
  GlobalKey<NavigatorState> get branchKey => NavigatorKey.introBranchKey;

  IntroBranch()
      : super(
          initialLocation: AppRoute.intro,
          label: "인트로",
        );
}

// ✅ PermissionCheck 브랜치
class PermissionCheckBranch extends Branch {
  @override
  GlobalKey<NavigatorState> get branchKey =>
      NavigatorKey.permissionCheckBranchKey;

  PermissionCheckBranch()
      : super(
          initialLocation: AppRoute.permissionCheck,
          label: "권한 확인",
        );
}

// ✅ Login 브랜치
class LoginBranch extends Branch {
  @override
  GlobalKey<NavigatorState> get branchKey => NavigatorKey.loginBranchKey;

  LoginBranch()
      : super(
          initialLocation: AppRoute.login,
          label: "로그인",
        );
}

// ✅ 홈 브랜치
class HomeBranch extends Branch {
  @override
  GlobalKey<NavigatorState> get branchKey => NavigatorKey.homeBranchKey;

  HomeBranch()
      : super(
          initialLocation: AppRoute.home,
          selectedIcon: ImageUtil.showImage(
            "assets/icons/memo.svg",
          ),
          icon: ImageUtil.showImage("assets/icons/memo_unselecetd.svg"),
          label: "홈",
        );
}

// ✅ Edit 브랜치
class EditBranch extends Branch {
  @override
  GlobalKey<NavigatorState> get branchKey => NavigatorKey.editBranchKey;

  EditBranch()
      : super(
          initialLocation: AppRoute.edit,
          selectedIcon: ImageUtil.showImage(
            "assets/icons/edit.svg",
            color: Colors.white,
          ),
          icon: ImageUtil.showImage(
            "assets/icons/edit_unselected.svg",
            color: Colors.white,
          ),
          label: "수정",
        );
}

// ✅ Search 브랜치
class SearchBranch extends Branch {
  @override
  GlobalKey<NavigatorState> get branchKey => NavigatorKey.searchBranchKey;

  SearchBranch()
      : super(
          initialLocation: AppRoute.search,
          selectedIcon: ImageUtil.showImage(
            "assets/icons/search.svg",
            color: Colors.white,
          ),
          icon: ImageUtil.showImage(
            "assets/icons/search_unselected.svg",
          ),
          label: "검색",
        );
}

// ✅ Settings 브랜치
class SettingsBranch extends Branch {
  @override
  GlobalKey<NavigatorState> get branchKey => NavigatorKey.settingsBranchKey;

  SettingsBranch()
      : super(
          initialLocation: AppRoute.settings,
          selectedIcon: ImageUtil.showImage(
            "assets/icons/more.svg",
            color: Colors.white,
          ),
          icon: ImageUtil.showImage(
            "assets/icons/more.svg",
          ),
          label: "설정",
        );
}

// ✅ UserSetting 브랜치
class UserSettingBranch extends Branch {
  @override
  GlobalKey<NavigatorState> get branchKey => NavigatorKey.userSettingBranchKey;

  UserSettingBranch()
      : super(
          initialLocation: AppRoute.userSetting,
          label: "유저 설정",
        );
}

// ✅ Delete 브랜치
class DeleteBranch extends Branch {
  @override
  GlobalKey<NavigatorState> get branchKey => NavigatorKey.deleteBranchKey;

  DeleteBranch()
      : super(
          initialLocation: AppRoute.delete,
          selectedIcon: ImageUtil.showImage(
            "assets/icons/delete.svg",
            color: Colors.white,
          ),
          icon: ImageUtil.showImage(
            "assets/icons/delete_unselected.svg",
          ),
          label: "삭제",
        );
}

////////////////////////////////////////////////////////////

// ✅ 인트로 라우터
class IntroRoute extends Route {
  @override
  bool checkAuth(BuildContext context) => false;

  const IntroRoute() : super(const IntroView());
}

// ✅ 권한 체크 라우터
class PermissionCheckRoute extends Route {
  @override
  bool checkAuth(BuildContext context) => false;

  const PermissionCheckRoute()
      : super(
          const PermissionView(),
        );
}

// ✅ 로그인 라우터
class LoginRoute extends Route {
  @override
  bool checkAuth(BuildContext context) => false;

  const LoginRoute() : super(const AuthView());
}

// ✅ 홈 라우터
class HomeRoute extends Route {
  @override
  bool checkAuth(BuildContext context) => true;

  const HomeRoute() : super(const MemoHomeView());
}

// ✅ 수정 라우터
class EditRoute extends Route {
  @override
  bool checkAuth(BuildContext context) => true;

  const EditRoute() : super(const MemoEditView());
}

// ✅ 삭제 라우터
class MemoDeleteRoute extends Route {
  @override
  bool checkAuth(BuildContext context) => true;

  const MemoDeleteRoute() : super(const MemoDeleteView());
}

// ✅ 검색 라우터
class SearchRoute extends Route {
  @override
  bool checkAuth(BuildContext context) => true;

  const SearchRoute() : super(const SearchView());
}

// ✅ 설정 라우터
class SettingsRoute extends Route {
  @override
  bool checkAuth(BuildContext context) => true;

  const SettingsRoute() : super(const SettingsView());
}

// ✅ 유저 설정 라우터
class UserSettingRoute extends Route {
  @override
  bool checkAuth(BuildContext context) => true;

  const UserSettingRoute() : super(const UserSettingView());
}
