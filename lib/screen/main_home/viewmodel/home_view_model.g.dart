// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$completeResultAtom =
      Atom(name: '_HomeViewModelBase.completeResult', context: context);

  @override
  ObservableList<String> get completeResult {
    _$completeResultAtom.reportRead();
    return super.completeResult;
  }

  @override
  set completeResult(ObservableList<String> value) {
    _$completeResultAtom.reportWrite(value, super.completeResult, () {
      super.completeResult = value;
    });
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void aramaYap(String aramaMetni) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.aramaYap');
    try {
      return super.aramaYap(aramaMetni);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
completeResult: ${completeResult}
    ''';
  }
}
