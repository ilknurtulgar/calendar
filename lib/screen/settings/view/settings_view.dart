import 'package:calendar/core/base/view/base_view.dart';
import 'package:calendar/product/component/appbars/secondary_app_bar.dart';
import 'package:calendar/product/component/column/settings_column.dart';
import 'package:calendar/product/component/column/title_with_divider.dart';
import 'package:calendar/product/component/row/switch_row.dart';
import 'package:calendar/product/component/row/title_with_text_button_row.dart';
import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:calendar/screen/settings/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../product/component/buttons/custom_toggle_button/extension/toggle_type_extension.dart';
import '../../../product/component/list_view/custom_wrap.dart';
import '../../../product/constants/util/text_util/settings_text_util.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
        viewModel: SettingsViewModel(),
        onPageBuilder: ((context, model) {
          return Scaffold(
              appBar: SecondaryAppBar(
                title: SettingsTextUtil.settings,
                onPressed: () {},
              ),
              backgroundColor: SurfaceColors.HOVER_COLOR,
              body: CustomWrap(
                children: [
                  const SizedBox(height: 5),
                  const TitleWithDivider(title: SettingsTextUtil.general),
                  columnWithChooseOptionDialog(ToggleButtonType.theme, model, context),
                  columnWithChooseOptionDialog(ToggleButtonType.date_format, model, context),
                  columnWithChooseOptionDialog(ToggleButtonType.holidays, model, context),
                  Observer(
                    builder: (_) => TitleWithTextButton(
                        title: SettingsTextUtil.googleCalendar,
                        buttontext: model.isGoogleCalendarConnected.value
                            ? SettingsTextUtil.connected
                            : SettingsTextUtil.notConnected,
                        onPressed: () => model.openGoogleCalendarDialog(context)),
                  ),
                  const TitleWithDivider(title: SettingsTextUtil.occupation),
                  switchRow(false,model),
                  const TitleWithDivider(title: SettingsTextUtil.notifications),
                  switchRow(true,model),
                  const TitleWithDivider(title: SettingsTextUtil.reminders),
                  reminderSettingColumn(true, model, context),
                  reminderSettingColumn(false, model, context),
                  columnWithChooseOptionDialog(ToggleButtonType.remindingTime, model, context),
                  const SizedBox(height: 5),
                ],
              ));
        }));
  }

  Widget columnWithChooseOptionDialog(ToggleButtonType toggleButtonType,
      SettingsViewModel model, BuildContext context) {
    return Observer(
      builder: (_) => SettingsColumn(
          title: toggleButtonType.title,
          data: toggleButtonType == ToggleButtonType.theme
              ? model.chosenTheme.value
              : toggleButtonType == ToggleButtonType.date_format
                  ? model.chosenDateFormat.value
                  : toggleButtonType == ToggleButtonType.holidays
                      ? model.chosenHolidays.join(",").toString()
                      : model.activityRemindingTime.value,
          onPressed: () => model.choose(toggleButtonType,context)),
    );
  }

  Widget switchRow(bool isForNotificationPermission,SettingsViewModel model) {
    return SwitchRow(
          title: isForNotificationPermission
              ? SettingsTextUtil.notificationPermission
              : SettingsTextUtil.occupationCalendar,
          initialValue: isForNotificationPermission ? model.isNotificationsOn.value : model.isOccupationCalendarOn.value,
          switchFunction: isForNotificationPermission 
                           ? (isOn)=> model.changeValue(model.isNotificationsOn,isOn) 
                           : (isOn)=> model.changeValue(model.isOccupationCalendarOn,isOn),
    );
  }

  Observer reminderSettingColumn(
      bool isForRingtone, SettingsViewModel model, BuildContext context) {
    return Observer(
      builder: (_) => SettingsColumn(
        title: isForRingtone
            ? SettingsTextUtil.reminderProperties
            : SettingsTextUtil.allDayReminder,
        data: isForRingtone
            ? model.isVibrationOn.value
                ? "${SettingsTextUtil.vibration},${model.chosenRingtone.value}"
                : "${SettingsTextUtil.vibrationOff},${model.chosenRingtone.value}"
            : model.chosenAllDayReminder.value,
        onPressed: isForRingtone
            ? () => model.openReminderPropertiesDialog(context)
            : () => model.openTimeSelectionDialog(context),
      ),
    );
  }
}
