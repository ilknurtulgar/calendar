import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'core/init/init.dart';
import 'core/modules/localization/language_type.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageType.values.map((e) => e.getLocal).toList(),
      path: assetsPathLocalizations,
      child: const Init(),
    ),
  );
}


