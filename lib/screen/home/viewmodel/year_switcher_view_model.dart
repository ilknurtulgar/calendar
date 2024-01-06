import 'package:mobx/mobx.dart';

part 'year_switcher_view_model.g.dart';

int currentYear = DateTime.now().year;

List<int> years = List.generate(5, (index) => index + (currentYear - 2));

class YearSwitchViewModel = _YearSwitchViewModel with _$YearSwitchViewModel;

abstract class _YearSwitchViewModel with Store {

  @action
  void changeSwitchIndex() {
    
  }

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
