import 'package:mobx/mobx.dart';
part 'hour_minute_scroll_model.g.dart';

class HourMinuteScrollModel = HourMinuteScrollModelBase
    with _$HourMinuteScrollModel;

abstract class HourMinuteScrollModelBase with Store {
  @observable
  int chosenValue = 0;

  @action
  void changeChosenValue(int value) {
    chosenValue = value;
  }
}
