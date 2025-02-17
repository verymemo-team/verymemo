part of 'router.dart';

final appRouterProvider = Provider<AppRouter>((ref) {
  final interceptor = ref.watch(appRouterInterceptorProvider);
  return AppRouter(interceptor);
});

class AppRouter {
  final AppRouterInterceptor interceptor;

  AppRouter(this.interceptor);
  late final config = GoRouter(
    initialLocation: AppRoute.home,
    navigatorKey: NavigatorKey.routerKey,
    debugLogDiagnostics: true,
    routes: $appRoutes,
  );
}

/*
final router = GoRouter(
  // ... 기존 라우트 설정 ...

  // 리다이렉션 로직 추가
  redirect: AppRouterInterceptor.redirect,

  // 에러 핸들링
  errorBuilder: AppRouterInterceptor.errorBuilder,

  // 라우트 관찰
  observers: [
    GoRouterObserver(
      navigation: AppRouterInterceptor.routeObserver,
    ),
  ],
);

// GoRouter 옵저버 클래스
class GoRouterObserver extends NavigatorObserver {
  final void Function(BuildContext context, GoRouterState state) navigation;

  GoRouterObserver({required this.navigation});

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.navigator?.context != null) {
      navigation(
        route.navigator!.context,
        GoRouterState.of(route.navigator!.context),
      );
    }
  }
}

 */
