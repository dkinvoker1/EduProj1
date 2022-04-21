import 'package:auto_route/auto_route.dart';
import 'package:edu_proj1/routes/router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    var _currentUser = FirebaseAuth.instance.currentUser;
    if (_currentUser != null) {
      resolver.next(true);
    } else {
      router.push(LoginRoute());
    }
  }
}
