// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';

import '../pages/history_page.dart';
import '../pages/home_page.dart';
import '../pages/login.dart';
import '../pages/result_page.dart';
import '../pages/roll_page.dart';
import 'authGuard.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true),
    AutoRoute(page: MyHomePage, guards: [AuthGuard]),
    AutoRoute(page: RollPage, guards: [AuthGuard]),
    AutoRoute(page: ResultPage, guards: [AuthGuard]),
    AutoRoute(page: HistoryPage, guards: [AuthGuard]),
  ],
)
class $AppRouter {}
