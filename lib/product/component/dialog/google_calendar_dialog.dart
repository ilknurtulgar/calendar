// ignore_for_file: must_be_immutable

import 'package:calendar/product/component/buttons/custom_filled_button.dart';
import 'package:calendar/product/component/dialog/base_dialog.dart';
import 'package:flutter/material.dart';
import '../../constants/util/color_constants.dart';
import '../../constants/util/text_styles.dart';
import '../../constants/util/text_util/settings_text_util.dart';
import '../buttons/custom_text_button.dart';
import '../row/dialog_title.dart';

class GoogleCalendarDialog extends StatelessWidget {
  final String userEmail;
  bool isConnected;
  final Function() connectGoogleCalendar;
  final Function() changeAccount;

  GoogleCalendarDialog({
    super.key,
    required this.userEmail,
    required this.isConnected,
    required this.connectGoogleCalendar,
    required this.changeAccount,
  });

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: const DialogTitle(title: SettingsTextUtil.googleCalendar),
      content: AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        crossFadeState: isConnected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstChild: column(),
        secondChild: button(false),
      ),
      actions: [
        CustomTextButton(
          title: SettingsTextUtil.okay,
          isBlue: true,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget column() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(SettingsTextUtil.connectedAccount,style: textStyle(true)),
        Text(userEmail,style: textStyle(false)),
        Padding(
          padding: const EdgeInsets.only(top:10),
          child: button(true),
        ),
      ],
    );
  }

  Widget button(bool isForChangeAccount) {
    return CustomFilledButton(
        backgroundColor: SurfaceColors.PRIMARY_COLOR,
        borderColor: SurfaceColors.ON_PRIMARY_COLOR,
        text: isForChangeAccount ? SettingsTextUtil.changeAccount : SettingsTextUtil.connectAccount,
        textStyle: TextStyles.SMALL,
        onTap: isForChangeAccount
            ? changeAccount
            : connectGoogleCalendar
      );
  }

  TextStyle textStyle(bool isBold) => TextStyles.BODY_SECONDARY.copyWith(fontWeight: isBold ? FontWeight.bold : FontWeight.normal);
}
