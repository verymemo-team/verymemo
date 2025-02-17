part of 'router.dart';

final appRouterInterceptorProvider = Provider<AppRouterInterceptor>((ref) {
  return AppRouterInterceptor();
});

class AppRouterInterceptor {
  // class AppRouterInterceptor {
  //   static const String _tokenKey = 'auth_token';

//   static Future<String?> redirect(
//     BuildContext context,
//     GoRouterState state,
//   ) async {
//     final prefs = await SharedPreferences.getInstance();
//     final hasToken = prefs.getString(_tokenKey) != null;

//     // Route 인스턴스 찾기
//     final route = _findRouteByPath(state.matchedLocation);
//     if (route == null) return null;

//     // 1. 토큰이 없고 인증이 필요한 라우트인 경우 -> 로그인으로 리다이렉트
//     if (!hasToken && route.checkAuth(context)) {
//       return AppRoute.login;
//     }

//     // 2. 토큰이 있는데 인증이 필요없는 라우트인 경우 -> 홈으로 리다이렉트
//     if (hasToken && !route.checkAuth(context)) {
//       return AppRoute.home;
//     }

//     // 3. 그 외의 경우 -> 정상적으로 요청된 라우트로 이동
//     return null;
//   }

//   // 현재 경로에 해당하는 Route 인스턴스 찾기
//   static Route? _findRouteByPath(String path) {
//     switch (path) {
//       case AppRoute.intro:
//         return const IntroRoute();
//       case AppRoute.permissionCheck:
//         return const PermissionCheckRoute();
//       case AppRoute.login:
//         return const LoginRoute();
//       case AppRoute.profileSetting:
//         return const ProfileSettingRoute();
//       case AppRoute.home:
//         return const HomeRoute();
//       case AppRoute.edit:
//         return const EditRoute();
//       case AppRoute.feed:
//         return const FeedRoute();
//       case AppRoute.delete:
//         return const DeleteRoute();
//       case AppRoute.search:
//         return const SearchRoute();
//       case AppRoute.settings:
//         return const SettingsRoute();
//       default:
//         return null;
//     }
//   }

//   // 에러 핸들링
//   static Widget errorBuilder(
//     BuildContext context,
//     GoRouterState state,
//     Object error,
//   ) {
//     // 에러 페이지나 에러 처리 로직을 구현
//     return Scaffold(
//       body: Center(
//         child: Text(
//           '오류가 발생했습니다: ${error.toString()}',
//           style: const TextStyle(color: Colors.red),
//         ),
//       ),
//     );
//   }

//   // 로깅이나 분석을 위한 옵저버
//   static void routeObserver(
//     BuildContext context,
//     GoRouterState state,
//   ) {
//     debugPrint('현재 라우트: ${state.matchedLocation}');
//     // 여기에 애널리틱스 로깅 등을 추가할 수 있습니다
//   }
// }
}
