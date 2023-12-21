import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  ObservableList<String> completeResult = ObservableList<String>();
  @action
  void aramaYap(String aramaMetni) {
    completeResult
        .addAll(List.generate(5, (index) => '$aramaMetni için Sonuç $index'));
  }
}
