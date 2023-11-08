import 'package:mobx/mobx.dart';

part 'year_switcher_view_model.g.dart';

class YearSwitchViewModel = _YearSwitchViewModel with _$YearSwitchViewModel;

abstract class _YearSwitchViewModel with Store {
  @observable
  int selectedYear = DateTime.now().year;

  @action
  void setSelectedYear(int year) {
    selectedYear = year;
  }

  @observable
  int selectedMonth = DateTime.now().month;

  @action
  void setSelectedMonth(int month) {
    selectedMonth = month;
  }

  @action
  void increaseYear() {
    selectedYear++;
  }
}
