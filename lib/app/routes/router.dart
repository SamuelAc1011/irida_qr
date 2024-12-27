import 'package:auto_route/auto_route.dart';
import 'package:irida_qr/app/routes/router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Provider|Screen,Route',
)
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
      ];
}
