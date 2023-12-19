import 'package:mobx/mobx.dart';
part 'toggle_button_model.g.dart';

class ToggleButtonModel = ToggleButtonModelBase with _$ToggleButtonModel;

abstract class ToggleButtonModelBase with Store {
  int length = 0;
  Observable<int> chosenIndex = 0.obs();
  ObservableList<int> chosenIndexes = ObservableList<int>.of(List.empty());

  late ObservableList<bool> oneSelected = ObservableList.of(
      List.generate(length, (index) => chosenIndex.value == index));

  late ObservableList<bool> multipleSelected = ObservableList.of(
      List.generate(length, (index) => chosenIndexes.contains(index)));

  @action
  void oneSelectionFunction(int index) {
    int i = 0;
    chosenIndex.value = index;
    for (i = 0; i < length; i++) {
      oneSelected[i] = i == chosenIndex.value;
    }
  }

  @action
  void multipleSelectionFunction(int index) {
    multipleSelected[index] = !multipleSelected[index];
    if (chosenIndexes.contains(index)) {
      chosenIndexes.remove(index);
    } else {
      chosenIndexes.add(index);
    }
  }
}
