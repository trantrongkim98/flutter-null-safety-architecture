import 'package:flutter/material.dart';
import 'package:flutterarchitecture/src/ui/widgets/app_header.dart';
import 'package:flutterarchitecture/src/utils/extention/context_extension.dart';
import 'package:flutterarchitecture/src/utils/extention/string_extension.dart';

/// [SplashScreenPage] this's Splash Screen of app
class SplashScreenPage extends StatefulWidget {
  /// [router] this's router to identify Screen
  static const String router = 'SplashScreenPage';

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _content(),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  Widget _content() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _header(),
          Spacer(),
          _switchTheme(),
          Spacer(),
        ],
      ),
    );
  }

  Widget _header() {
    return AppHeader(
      back: Container(height: 64, width: 64, child: Icon(Icons.arrow_back)),
      more: Container(height: 64, width: 64, child: Icon(Icons.more_horiz)),
      backgroundColor: Theme.of(context).cardColor,
      title: Center(
        child: Text(
          'app_name'.of(context),
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      isSafeArea: true,
    );
  }

  Widget _switchTheme() {
    return RawMaterialButton(
      onPressed: context.appCubit.onSwitchTheme,
      child: Container(
        height: 60,
        width: 100,
        color: Theme.of(context).buttonColor,
      ),
    );
  }
}
