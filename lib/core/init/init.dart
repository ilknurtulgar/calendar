/*


© 2023 Skylab MobiLab

User         : alisinancobani
Project Name : calendar 
Name         : Ali Sinan COBANI
Date         : 16.11.2023 11:22
Notes        : 

*/




import 'package:calendar/screen/create_event/view/create_event_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../screen/login/view/login_view.dart';
import '../di/di.dart';
import '../managers/localization_manager.dart';

class Init extends StatefulWidget {
  const Init({super.key});

  @override
  State<Init> createState() => _InitState();
}

class _InitState extends State<Init> {
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
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false), // sayfaları kaydırırken sonda ve başta oluşan parlak rengi kaldırmak için
      home: const CreateEventView(),
    );
  }
}