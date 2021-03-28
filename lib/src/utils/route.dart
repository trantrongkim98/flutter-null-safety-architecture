import 'package:flutter/material.dart';
import 'package:flutterarchitecture/src/ui/splash/splash_screen_page.dart';
import 'package:flutterarchitecture/src/ui/widgets/page_route/scale_page_route.dart';
import 'package:flutterarchitecture/src/utils/colors.dart';

/// [RouteUtil] at where contain of all the route of app
class RouteUtil {
  /// [RouteUtil.initial] this's the first router
  static const String initial = SplashScreenPage.router;

  /// [routes] the list router of app
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreenPage.router: (ctx) {
      return SplashScreenPage();
    },
    "red": (ctx) => Container(
          color: AppColor.red,
        ),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (settings.name == SplashScreenPage.router) {
      return MaterialPageRoute(builder: (ctx) => SplashScreenPage());
    } else {
      return ScalePageRoute(Container(
        color: AppColor.red,
      ));
    }
  }
}
