import 'package:bookington_v2_2/core/app_export.dart';
import 'package:flutter/material.dart';

/// User cannot go to the dashboard screen if he doesn’t have a login token.
class RouteGuard extends GetMiddleware {
  String? userToken = PrefUtils.getAccessToken();

  // @override
  // RouteSettings? redirect(String? route) {
  //   // print('route: ' + route!);
  //   print('userToken: ' + userToken!);
  //   return userToken == null
  //       ?const RouteSettings(name: AppRoutes.loginScreen):null ;
  // }

// @override
// RouteSettings redirect(String route) {
//   return userToken == null ? const RouteSettings(name:Routes.login): null;
// }
}
