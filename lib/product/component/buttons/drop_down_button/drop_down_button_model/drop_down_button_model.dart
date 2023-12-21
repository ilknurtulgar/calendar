import 'package:mobx/mobx.dart';
part 'drop_down_button_model.g.dart';

class DropDownButtonModel = DropDownButtonModelBase with _$DropDownButtonModel;

abstract class DropDownButtonModelBase with Store {
  Observable<String> chosenValue = "".obs();

  @action
  void changeChosenValue(String value) {
    chosenValue.value = value;
  }
}
