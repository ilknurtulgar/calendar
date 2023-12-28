// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:calendar/product/component/dialog/google_calendar_dialog.dart';
import 'package:calendar/product/component/dialog/reminder_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/store/base_store.dart';
import '../../../product/component/buttons/custom_toggle_button/extension/toggle_type_extension.dart';
import '../../../product/component/dialog/choose_option_dialog.dart';
import '../../../product/component/dialog/time_selection_dialog.dart';
part 'settings_view_model.g.dart';

class SettingsViewModel = SettingsViewModelBase with _$SettingsViewModel;

abstract class SettingsViewModelBase extends BaseStore with Store {
  Observable<String> chosenTheme = "".obs();
  Observable<String> chosenDateFormat = "".obs();
  ObservableList<String> chosenHolidays =
      ObservableList<String>.of(List.empty());
  Observable<String> userEmail = "".obs();
  Observable<bool> isGoogleCalendarConnected = false.obs();
  Observable<bool> isOccupationCalendarOn = false.obs();
  Observable<bool> isNotificationsOn = false.obs();
  Observable<bool> isVibrationOn = false.obs();
  Observable<String> chosenRingtone = "".obs();
  Observable<String> chosenAllDayReminder = "".obs();
  Observable<int> chosenHour = 0.obs();
  Observable<int> chosenMinute = 0.obs();
  Observable<String> activityRemindingTime = "".obs();

  @override
  void onInit() {
    chosenTheme.value = "Koyu";
    chosenDateFormat.value = "gg/aa/yyyy";
    chosenHolidays = ObservableList.of(["Cumartesi", "Pazar"]);
    userEmail.value = "user@gmail.com";
    isGoogleCalendarConnected.value = false;
    isOccupationCalendarOn.value = false;
    isNotificationsOn.value = false;
    isVibrationOn.value = false;
    chosenRingtone.value = "Zil Sesi 1";
    chosenAllDayReminder.value = "15.30";
    List<String> hourMinute = chosenAllDayReminder.value.split(".");
    chosenHour.value = int.parse(hourMinute.first);
    chosenMinute.value = int.parse(hourMinute.last);
    activityRemindingTime.value = "Etkinlik anında hatırlat.";
  }

  @override
  void dispose() {}

  @action
  void choose(ToggleButtonType type, BuildContext context) {
    int chosenIndex = 0;
    List<int> chosenIndexes = [];
    toggleTypeFunction(type,
        (chosenValue) => chosenIndex = type.options.indexOf(chosenValue.value));
    if (type == ToggleButtonType.holidays) {
      for (var holiday in chosenHolidays)
        chosenIndexes.add(type.options.indexOf(holiday));
    }
    showDialog(
        context: context,
        builder: (context) {
          return type == ToggleButtonType.holidays
              ? ChooseOptionDialog(
                  title: type.title,
                  options: type.options,
                  initialChosenIndexes: chosenIndexes,
                  height: type.height,
                  chooseMultipleOptionFunction: (indexes) =>
                      chosenIndexes = indexes,
                  onSave: () {
                    chosenHolidays.clear();
                    chosenHolidays = ObservableList.of(List.generate(
                        chosenIndexes.length,
                        (index) => type.options[chosenIndexes[index]]));
                    Navigator.pop(context);
                  },
                )
              : ChooseOptionDialog(
                  title: type.title,
                  options: type.options,
                  initialChosenIndex: chosenIndex,
                  height: type.height,
                  chooseOptionFunction: (index) => chosenIndex = index,
                  onSave: () {
                    toggleTypeFunction(
                        type,
                        (chosenValue) =>
                            chosenValue.value = type.options[chosenIndex]);
                    Navigator.pop(context);
                  },
                );
        });
  }

  @action
  void openGoogleCalendarDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Observer(
              builder: (_) => GoogleCalendarDialog(
                userEmail: userEmail.value,
                isConnected: isGoogleCalendarConnected.value,
                connectGoogleCalendar: () =>
                    changeValue(isGoogleCalendarConnected, true),
                changeAccount: () {},
              ),
            ));
  }

  @action
  void openReminderPropertiesDialog(BuildContext context) {
    String ringtone = chosenRingtone.value;
    bool vibration = isVibrationOn.value;
    showDialog(
        context: context,
        builder: (context) {
          return ReminderDialog(
            initialVibrationOn: isVibrationOn.value,
            switchVibration: (isOn) => vibration = isOn,
            initialRingtone: chosenRingtone.value,
            onRingtoneChanged: (newRingtone) => ringtone = newRingtone!,
            onSave: () {
              changeValue(chosenRingtone, ringtone);
              changeValue(isVibrationOn, vibration);
              Navigator.pop(context);
            },
          );
        });
  }

  @action
  void openTimeSelectionDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return TimeSelectionDialog(
            initialHour: chosenHour.value,
            onHourChanged: (hour) => changeValue(chosenHour, hour),
            initialMinute: chosenMinute.value,
            onMinuteChanged: (minute) => changeValue(chosenMinute, minute),
            onSave: () {
              String hour = chosenHour.value < 10 ? "0${chosenHour.value}" : chosenHour.value.toString();
              String minute = chosenMinute.value < 10 ? "0${chosenMinute.value}" : chosenMinute.value.toString();
              changeValue(chosenAllDayReminder, "$hour.$minute");
              Navigator.pop(context);
            },
          );
        });
  }

  @action
  void toggleTypeFunction(
      ToggleButtonType type, Function(Observable<String>) function) {
    switch (type) {
      case ToggleButtonType.theme:
        function(chosenTheme);
        break;
      case ToggleButtonType.date_format:
        function(chosenDateFormat);
        break;
      case ToggleButtonType.remindingTime:
        function(activityRemindingTime);
        break;
      default:
        break;
    }
  }

  @action
  void changeValue(Observable observable, dynamic value) => observable.value = value;
}
