// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateEventViewmodel on _CreateEventViewmodel, Store {
  late final _$isTimeAtom =
      Atom(name: '_CreateEventViewmodel.isTime', context: context);

  @override
  bool get isTime {
    _$isTimeAtom.reportRead();
    return super.isTime;
  }

  @override
  set isTime(bool value) {
    _$isTimeAtom.reportWrite(value, super.isTime, () {
      super.isTime = value;
    });
  }

  late final _$_CreateEventViewmodelActionController =
      ActionController(name: '_CreateEventViewmodel', context: context);

  @override
  void changeIsTime() {
    final _$actionInfo = _$_CreateEventViewmodelActionController.startAction(
        name: '_CreateEventViewmodel.changeIsTime');
    try {
      return super.changeIsTime();
    } finally {
      _$_CreateEventViewmodelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isTime: ${isTime}
    ''';
  }
}
