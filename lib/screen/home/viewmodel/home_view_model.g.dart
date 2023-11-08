// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModel, Store {
  late final _$switchIndexAtom =
      Atom(name: '_HomeViewModel.switchIndex', context: context);

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

  late final _$_HomeViewModelActionController =
      ActionController(name: '_HomeViewModel', context: context);

  @override
  void changeSwitchIndex(int index) {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.changeSwitchIndex');
    try {
      return super.changeSwitchIndex(index);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
switchIndex: ${switchIndex}
    ''';
  }
}
