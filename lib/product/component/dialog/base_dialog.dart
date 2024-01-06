import 'package:flutter/material.dart';
import '../../../core/base/util/color.dart';
import '../../constants/util/border_radius_constants.dart';

class BaseDialog extends StatelessWidget {
  final Widget? title;
  final Widget content;
  final List<Widget> actions;
  const BaseDialog({super.key,this.title,required this.content,required this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorUtility().hover,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.MEDIUM,
        side: BorderSide(color: ColorUtility().secondary),
      ),
      title: title,
      insetPadding: const EdgeInsets.symmetric(horizontal: 45), // dialog dışındaki padding
      content: content,
      contentPadding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
      actions: actions,
      actionsAlignment: actions.length > 1 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 25) + const EdgeInsets.only(bottom: 25),
    );
  }
}