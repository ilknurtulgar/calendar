import 'package:calendar/screen/login/view/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'core/managers/localization_manager.dart';
import 'core/modules/localization/language_type.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageType.values.map((e) => e.getLocal).toList(),
      path: assetsPathLocalizations,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final LocalizationManager _localizationManager = getIt<LocalizationManager>();

  @override
  void didChangeDependencies() {
    setLanguage();
    super.didChangeDependencies();
  }

  void setLanguage() {
    _localizationManager.getLanguage().then(
          (value) => context.setLocale(
            value.getLocal,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const LoginView(),
    );
  }
}
