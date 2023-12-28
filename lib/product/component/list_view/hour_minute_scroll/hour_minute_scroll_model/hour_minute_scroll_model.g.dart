// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_minute_scroll_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HourMinuteScrollModel on HourMinuteScrollModelBase, Store {
  late final _$chosenValueAtom =
      Atom(name: 'HourMinuteScrollModelBase.chosenValue', context: context);

  @override
  int get chosenValue {
    _$chosenValueAtom.reportRead();
    return super.chosenValue;
  }

  @override
  set chosenValue(int value) {
    _$chosenValueAtom.reportWrite(value, super.chosenValue, () {
      super.chosenValue = value;
    });
  }

  late final _$HourMinuteScrollModelBaseActionController =
      ActionController(name: 'HourMinuteScrollModelBase', context: context);

  @override
  void changeChosenValue(int value) {
    final _$actionInfo = _$HourMinuteScrollModelBaseActionController
        .startAction(name: 'HourMinuteScrollModelBase.changeChosenValue');
    try {
      return super.changeChosenValue(value);
    } finally {
      _$HourMinuteScrollModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chosenValue: ${chosenValue}
    ''';
  }
}
