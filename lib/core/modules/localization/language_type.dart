/*

© 2023 Skylab MobiLab

User         : alisinancobani
Project Name : calendar 
Name         : Ali Sinan COBANI
Date         : 16.11.2023 09:46
Notes        : 

*/

import 'dart:ui';

import 'localizations_strings.dart';

enum LanguageType {
  turkish,
  english;

  String getValue() {
    switch (this) {
      case LanguageType.english:
        return englishS;
      case LanguageType.turkish:
        return turkishS;
    }
  }

  Locale get getLocal {
    switch (this) {
      case LanguageType.turkish:
        return turkishLocal;
      case LanguageType.english:
        return englishLocal;
    }
  }

  String get getTitle {
    switch (this) {
      case LanguageType.turkish:
        return LocalizationsStrings.turkish;
      case LanguageType.english:
        return LocalizationsStrings.english;
    }
  }
}

const String turkishS = "tr";
const String englishS = "en";
const String assetsPathLocalizations = "assets/translations";
const Locale turkishLocal = Locale("tr", "TR");
const Locale englishLocal = Locale("en", "US");
