// ignore_for_file: constant_identifier_names

import '../../../../constants/util/text_util/settings_text_util.dart';

enum ToggleButtonType { theme, date_format, holidays, remindingTime }

extension ToggleButtonTypeExtension on ToggleButtonType {
  String get title {
    switch (this) {
      case ToggleButtonType.theme:
        return SettingsTextUtil.theme;
      case ToggleButtonType.date_format:
        return SettingsTextUtil.dateFormat;
      case ToggleButtonType.holidays:
        return SettingsTextUtil.holidays;
      case ToggleButtonType.remindingTime:
        return SettingsTextUtil.defaultReminderTime;
    }
  }

  List<String> get options {
    switch (this) {
      case ToggleButtonType.theme:
        return SettingsTextUtil.themeOptions;
      case ToggleButtonType.date_format:
        return SettingsTextUtil.dateFormatOptions;
      case ToggleButtonType.holidays:
        return SettingsTextUtil.days;
      case ToggleButtonType.remindingTime:
        return SettingsTextUtil.remindingTimeOptions;
    }
  }

  double get height {
    switch (this) {
      case ToggleButtonType.theme:
        return 65;
      case ToggleButtonType.date_format:
        return 88;
      case ToggleButtonType.holidays:
        return 155;
      case ToggleButtonType.remindingTime:
        return 135;
    }
  }
}
