// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsViewModel on SettingsViewModelBase, Store {
  late final _$SettingsViewModelBaseActionController =
      ActionController(name: 'SettingsViewModelBase', context: context);

  @override
  void choose(ToggleButtonType type, BuildContext context) {
    final _$actionInfo = _$SettingsViewModelBaseActionController.startAction(
        name: 'SettingsViewModelBase.choose');
    try {
      return super.choose(type, context);
    } finally {
      _$SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void openGoogleCalendarDialog(BuildContext context) {
    final _$actionInfo = _$SettingsViewModelBaseActionController.startAction(
        name: 'SettingsViewModelBase.openGoogleCalendarDialog');
    try {
      return super.openGoogleCalendarDialog(context);
    } finally {
      _$SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void openReminderPropertiesDialog(BuildContext context) {
    final _$actionInfo = _$SettingsViewModelBaseActionController.startAction(
        name: 'SettingsViewModelBase.openReminderPropertiesDialog');
    try {
      return super.openReminderPropertiesDialog(context);
    } finally {
      _$SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void openTimeSelectionDialog(BuildContext context) {
    final _$actionInfo = _$SettingsViewModelBaseActionController.startAction(
        name: 'SettingsViewModelBase.openTimeSelectionDialog');
    try {
      return super.openTimeSelectionDialog(context);
    } finally {
      _$SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTypeFunction(
      ToggleButtonType type, dynamic Function(Observable<String>) function) {
    final _$actionInfo = _$SettingsViewModelBaseActionController.startAction(
        name: 'SettingsViewModelBase.toggleTypeFunction');
    try {
      return super.toggleTypeFunction(type, function);
    } finally {
      _$SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeValue(Observable<dynamic> observable, dynamic value) {
    final _$actionInfo = _$SettingsViewModelBaseActionController.startAction(
        name: 'SettingsViewModelBase.changeValue');
    try {
      return super.changeValue(observable, value);
    } finally {
      _$SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
