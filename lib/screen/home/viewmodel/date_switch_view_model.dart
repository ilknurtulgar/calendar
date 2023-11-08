import 'package:mobx/mobx.dart';

part 'date_switch_view_model.g.dart';

enum SwitchIndex {
  week,
  month,
  day,
  year,
  event,
}

class DateSwitchViewModel = _DateSwitchViewModel with _$DateSwitchViewModel;

abstract class _DateSwitchViewModel with Store {
  @observable
  SwitchIndex switchIndex = SwitchIndex.week;

  @action
  void changeSwitchIndex(SwitchIndex date) {
    switchIndex = SwitchIndex.values[date.index];
  }
}
