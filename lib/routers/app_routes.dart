part of 'router.dart';

abstract class AppRoute {
  static const intro = "/intro";
  static const permissionCheck = "/permissionCheck";
  static const login = "/login";

  static const home = "/home";
  // static const edit = "/edit";
  static const search = "/search";
  static const settings = "/settings";

  static const userSetting = "/userSetting";
  static const delete = "/delete";
}

// 공통 라우트 클래스화
abstract class CommonRoute extends GoRouteData {
  final Widget child;
  final String? path;
  const CommonRoute(this.child, {this.path});

  static String? $vaildatePath(String path) {
    if (path.isNotEmpty) return path;
    return null;
  }

  // 에러 대화창 표시
  void showErrorDialog(BuildContext context, String message);

  // 인증 여부 확인
  bool checkAuth(BuildContext context);

  @override
  Widget build(BuildContext context, GoRouterState state) => child;
}
