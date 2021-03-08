import 'package:flutter/cupertino.dart';
import 'package:flutterarchitecture/src/utils/locale/locale_service.dart';
import 'context_extension.dart';
/// [Translation] this's translation for app
extension Translation on String{
  /// [of(BuildContext)] translation key to languages
  String of(BuildContext context) {

    String countryCode = context.appCubit.state.locale.toLanguageTag();

    Map<String,String> map = LocaleService.langs[countryCode] !;
    if(map.containsKey(this)){
      return map[this]??this;
    }
    return this;
  }
}