import 'package:verymemo/routers/router.dart';

class NavigationService {
  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return NavigatorKey.routerKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }
}
