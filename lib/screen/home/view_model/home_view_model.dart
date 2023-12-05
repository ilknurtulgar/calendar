/*

© 2023 B1 Digital
© 2023 Skylab MobiLab

User         : alisinancobani
Project Name : calendar
Name         : Ali Sinan COBANI
Date         : 6.12.2023 00:07
Notes        :

*/

import 'package:mobx/mobx.dart';
import '../../../core/base/store/base_store.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase extends BaseStore with Store {
  @override
  void onInit() {}

  @override
  void dispose() {}
}
