        
// @CupertinoAutoRouter        
// @AdaptiveAutoRouter        
// @CustomAutoRouter        
import 'package:auto_route/auto_route.dart';

import '../home_page.dart';
import '../result_page.dart';

@MaterialAutoRouter(        
  replaceInRouteName: 'Page,Route',        
  routes: <AutoRoute>[        
    AutoRoute(page: MyHomePage, initial: true),        
    AutoRoute(page: ResultPage),        
  ],        
)        
class $AppRouter {} 