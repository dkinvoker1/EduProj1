        
// @CupertinoAutoRouter        
// @AdaptiveAutoRouter        
// @CustomAutoRouter        
import 'package:auto_route/auto_route.dart';

import '../pages/history_page.dart';
import '../pages/home_page.dart';
import '../pages/login.dart';
import '../pages/result_page.dart';
import '../pages/roll_page.dart';

@MaterialAutoRouter(        
  replaceInRouteName: 'Page,Route',        
  routes: <AutoRoute>[        
    AutoRoute(page: LoginPage, initial: true),  
    AutoRoute(page: MyHomePage),        
    AutoRoute(page: RollPage),
    AutoRoute(page: ResultPage),
    AutoRoute(page: HistoryPage),
  ],        
)        
class $AppRouter {} 