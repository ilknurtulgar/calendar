// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_switch_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DateSwitchViewModel on _DateSwitchViewModel, Store {
  late final _$switchIndexAtom =
      Atom(name: '_DateSwitchViewModel.switchIndex', context: context);

  @override
  SwitchIndex get switchIndex {
    _$switchIndexAtom.reportRead();
    return super.switchIndex;
  }

  @override
  set switchIndex(SwitchIndex value) {
    _$switchIndexAtom.reportWrite(value, super.switchIndex, () {
      super.switchIndex = value;
    });
  }

  late final _$_DateSwitchViewModelActionController =
      ActionController(name: '_DateSwitchViewModel', context: context);

  @override
  void changeSwitchIndex(SwitchIndex date) {
    final _$actionInfo = _$_DateSwitchViewModelActionController.startAction(
        name: '_DateSwitchViewModel.changeSwitchIndex');
    try {
      return super.changeSwitchIndex(date);
    } finally {
      _$_DateSwitchViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
switchIndex: ${switchIndex}
    ''';
  }
}
