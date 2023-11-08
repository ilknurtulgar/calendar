// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'year_switcher_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$YearSwitchViewModel on _YearSwitchViewModel, Store {
  late final _$selectedYearAtom =
      Atom(name: '_YearSwitchViewModel.selectedYear', context: context);

  @override
  int get selectedYear {
    _$selectedYearAtom.reportRead();
    return super.selectedYear;
  }

  @override
  set selectedYear(int value) {
    _$selectedYearAtom.reportWrite(value, super.selectedYear, () {
      super.selectedYear = value;
    });
  }

  late final _$selectedMonthAtom =
      Atom(name: '_YearSwitchViewModel.selectedMonth', context: context);

  @override
  int get selectedMonth {
    _$selectedMonthAtom.reportRead();
    return super.selectedMonth;
  }

  @override
  set selectedMonth(int value) {
    _$selectedMonthAtom.reportWrite(value, super.selectedMonth, () {
      super.selectedMonth = value;
    });
  }

  late final _$_YearSwitchViewModelActionController =
      ActionController(name: '_YearSwitchViewModel', context: context);

  @override
  void setSelectedYear(int year) {
    final _$actionInfo = _$_YearSwitchViewModelActionController.startAction(
        name: '_YearSwitchViewModel.setSelectedYear');
    try {
      return super.setSelectedYear(year);
    } finally {
      _$_YearSwitchViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedMonth(int month) {
    final _$actionInfo = _$_YearSwitchViewModelActionController.startAction(
        name: '_YearSwitchViewModel.setSelectedMonth');
    try {
      return super.setSelectedMonth(month);
    } finally {
      _$_YearSwitchViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseYear() {
    final _$actionInfo = _$_YearSwitchViewModelActionController.startAction(
        name: '_YearSwitchViewModel.increaseYear');
    try {
      return super.increaseYear();
    } finally {
      _$_YearSwitchViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedYear: ${selectedYear},
selectedMonth: ${selectedMonth}
    ''';
  }
}
