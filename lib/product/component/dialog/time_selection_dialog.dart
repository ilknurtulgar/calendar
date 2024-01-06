import 'package:calendar/product/component/buttons/custom_text_button.dart';
import 'package:calendar/product/component/container/time_selection_container.dart';
import 'package:calendar/product/component/dialog/base_dialog.dart';
import 'package:calendar/product/component/row/dialog_title.dart';
import 'package:calendar/product/constants/util/text_util/settings_text_util.dart';
import 'package:flutter/material.dart';
import '../../constants/util/icon_util.dart';

class TimeSelectionDialog extends StatelessWidget {
  final int initialHour;
  final Function(int) onHourChanged;
  final int initialMinute;
  final Function(int) onMinuteChanged;
  final Function() onSave;
  const TimeSelectionDialog(
      {super.key,
      required this.initialHour,
      required this.onHourChanged,
      required this.initialMinute,
      required this.onMinuteChanged,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
        title: const DialogTitle(
          title: SettingsTextUtil.clock,
          iconData: IconUtil.clock,
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65),
          child: TimeSelectionContainer(
              initialHour: initialHour,
              onHourChanged: onHourChanged,
              initialMinute: initialMinute,
              onMinuteChanged: onMinuteChanged),
        ),
        actions: [
          CustomTextButton(
              title: SettingsTextUtil.okay,
              isBlue: true,
              onPressed: onSave,
          ),
        ]);
  }
}
