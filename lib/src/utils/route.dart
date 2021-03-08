import 'package:flutter/material.dart';
import 'package:flutterarchitecture/src/ui/splash/splash_screen_page.dart';

/// [RouteUtil] at where contain of all the route of app
class RouteUtil {
  /// [RouteUtil.initial] this's the first router
  static const String initial = SplashScreenPage.router;

  /// [routes] the list router of app
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreenPage.router: (ctx) {
      return SplashScreenPage();
    },
  };
}
