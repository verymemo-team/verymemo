part of 'router.dart';

final appRouterInterceptorProvider = Provider<AppRouterInterceptor>((ref) {
  return AppRouterInterceptor();
});

class AppRouterInterceptor {
  Future<String?> redirect(
    BuildContext context,
    GoRouterState state,
    Ref ref,
  ) async {
    final storage = ref.watch(storageProvider);
    final isNew = await storage.get(key: deviceId) != null;
    final route = _findRouteByPath(state.matchedLocation);
    if (route == null) return null;

    if (context.mounted) {
      // 1. 처음은 아닌데 인증이 필요한 라우트인 경우: 로그인으로 리다이렉트
      if (!isNew && route.checkAuth(context)) {
        return AppRoute.login;
      }

      // 2. 처음은 아니면서, 인증이 필요없는 라우트인 경우: 홈으로 리다이렉트
      if (!isNew && !route.checkAuth(context)) {
        return AppRoute.home;
      }

      // 3. 처음인 경우: 인트로로 리다이렉트
      if (isNew) {
        return AppRoute.intro;
      }
    }

    return null;
  }

  static Route? _findRouteByPath(String path) {
    switch (path) {
      case AppRoute.intro:
        return const IntroRoute();
      case AppRoute.permissionCheck:
        return const PermissionCheckRoute();
      case AppRoute.login:
        return const LoginRoute();
      case AppRoute.profileSetting:
        return const ProfileSettingRoute();
      case AppRoute.home:
        return const HomeRoute();
      case AppRoute.edit:
        return const EditRoute();
      case AppRoute.feed:
        return const FeedRoute();
      case AppRoute.delete:
        return const DeleteRoute();
      case AppRoute.search:
        return const SearchRoute();
      case AppRoute.settings:
        return const SettingsRoute();
      default:
        return null;
    }
  }

  // 에러 핸들링
  static Widget errorBuilder(
    BuildContext context,
    GoRouterState state,
    Object error,
  ) {
    // 에러 페이지나 에러 처리 로직을 구현
    return Scaffold(
      body: Center(
        child: Text(
          '오류가 발생했습니다: ${error.toString()}',
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
