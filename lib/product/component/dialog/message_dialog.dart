import 'package:calendar/product/component/dialog/base_dialog.dart';
import 'package:flutter/material.dart';
import '../../../core/base/util/color.dart';
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
      content: text(message, ColorUtility().dark),
      actions: [
        yesNoTextButton(false, context),
        yesNoTextButton(true, context),
      ],
    );
  }

  TextButton yesNoTextButton(bool isForYes, BuildContext context) {
    String buttonText = isForYes ? TextUtil.yes : TextUtil.no;
    Color textColor = isForYes ? ColorUtility().secondary : ColorUtility().onPrimary;
    Alignment alignment = isForYes ? Alignment.centerRight : Alignment.centerLeft;
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        alignment: alignment,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: isForYes ? acceptFunction : () => Navigator.pop(context),
      child: text(buttonText, textColor),
    );
  }

  Text text(String text, Color color) => Text(
        text,
        style: TextStyles.SMALL.copyWith(color: color),
      );
}
