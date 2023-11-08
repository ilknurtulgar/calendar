import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

enum SwitchIndex {
  week,
  month,
  day,
  year,
  event,
}

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  @observable
  SwitchIndex switchIndex = SwitchIndex.week;

  @action
  void changeSwitchIndex(SwitchIndex date) {
    switchIndex = SwitchIndex.values[date.index];
  }
}
