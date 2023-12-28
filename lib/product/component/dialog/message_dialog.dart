import 'package:calendar/product/component/buttons/custom_text_button.dart';
import 'package:calendar/product/component/dialog/base_dialog.dart';
import 'package:flutter/material.dart';
import '../../constants/util/text_styles.dart';
import '../../constants/util/text_util.dart';

class MessageDialog extends StatelessWidget {
  final String message;
  final Function() acceptFunction;
  const MessageDialog(
      {super.key, required this.message, required this.acceptFunction});

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      content: Text(message, style: TextStyles.SMALL),
      actions: [
        yesNoTextButton(false, context),
        yesNoTextButton(true, context),
      ],
    );
  }

  Widget yesNoTextButton(bool isForYes, BuildContext context) {
    String buttonText = isForYes ? TextUtil.yes : TextUtil.no;
    return CustomTextButton(
      title: buttonText,
      isBlue: isForYes,
      onPressed: isForYes ? acceptFunction : () => Navigator.pop(context),
    );
  }
}
