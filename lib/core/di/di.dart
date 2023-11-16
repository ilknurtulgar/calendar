/*

© 2023 B1 Digital

User         : alisinancobani
Project Name : calendar 
Name         : Ali Sinan COBANI
Date         : 16.11.2023 10:12
Notes        : 

*/

import 'package:calendar/core/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di_orders.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

@module
abstract class RegisterModule {
  @preResolve
  @LazySingleton(order: DiOrder.sharedPreferences)
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
