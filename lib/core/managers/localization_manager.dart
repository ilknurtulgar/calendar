/*

© 2023 Skylab MobiLab

User         : alisinancobani
Project Name : calendar 
Name         : Ali Sinan COBANI
Date         : 16.11.2023 10:07
Notes        : 

*/

import 'package:devicelocale/devicelocale.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di/di_orders.dart';
import '../modules/localization/language_type.dart';

@Singleton(order: DiOrder.localizationManager)
class LocalizationManager {
  String prefKey = "languageKey";

  final SharedPreferences prefs;

  LocalizationManager(this.prefs);

  Future<void> setLanguage(LanguageType languageType) async {
    await prefs.setString(prefKey, languageType.name);
  }

  Future<LanguageType> getLanguage() async {
    final languageS = prefs.getString(prefKey);
    LanguageType? returnData = LanguageType.values
        .where(
          (element) => element.name == languageS,
        )
        .firstOrNull;

    if (returnData == null) {
      String? locale = await Devicelocale.currentLocale;
      if (locale == "tr-TR") {
        returnData = LanguageType.turkish;
      }
      if (locale == "en-US") {
        returnData = LanguageType.english;
      } else {
        returnData = LanguageType.turkish;
      }
    }

    return returnData;
  }
}
