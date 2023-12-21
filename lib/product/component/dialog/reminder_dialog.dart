import 'package:calendar/product/component/buttons/custom_text_button.dart';
import 'package:calendar/product/component/buttons/drop_down_button/widget/drop_down_button.dart';
import 'package:calendar/product/component/dialog/base_dialog.dart';
import 'package:calendar/product/component/row/dialog_title.dart';
import 'package:calendar/product/component/row/switch_row.dart';
import 'package:calendar/product/constants/util/text_styles.dart';
import 'package:calendar/product/constants/util/text_util/settings_text_util.dart';
import 'package:flutter/material.dart';
import '../../constants/util/icon_util.dart';

class ReminderDialog extends StatelessWidget {
  final bool initialVibrationOn;
  final Function(bool isOn) switchVibration;
  final String initialRingtone;
  final Function(String? ringtone) onRingtoneChanged;
  final Function() onSave;

  const ReminderDialog(
      {super.key,
      required this.initialVibrationOn,
      required this.switchVibration,
      required this.initialRingtone,
      required this.onRingtoneChanged,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: DialogTitle(title: SettingsTextUtil.reminders,iconData: IconUtil.notification.icon,),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SwitchRow(
              title: SettingsTextUtil.vibration,
              initialValue: initialVibrationOn,
              switchFunction: switchVibration),
          const Padding(
            padding: EdgeInsets.only(top: 15,bottom: 5,),
            child: Text(SettingsTextUtil.ringtone,style: TextStyles.MEDIUM_SECONDARY,),
          ),
          DropDownButton(
            options: SettingsTextUtil.ringtoneOptions,
            initialValue: initialRingtone,
            onChanged: onRingtoneChanged,
          ),
        ],
      ),
      actions: [
        CustomTextButton(
          title: SettingsTextUtil.okay,
          isBlue: true ,
          onPressed: onSave,
        )
      ],
    );
  }
}
