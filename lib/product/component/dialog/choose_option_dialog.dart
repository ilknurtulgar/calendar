// ignore_for_file: must_be_immutable

import 'package:calendar/product/component/buttons/custom_text_button.dart';
import 'package:calendar/product/component/buttons/custom_toggle_button/widget/custom_toggle_button.dart';
import 'package:calendar/product/component/dialog/base_dialog.dart';
import 'package:calendar/product/component/row/dialog_title.dart';
import 'package:calendar/product/constants/util/text_util/settings_text_util.dart';
import 'package:flutter/material.dart';

class ChooseOptionDialog extends StatelessWidget {
  final String title;
  final List<String> options;
  final Function() onSave;
  final double height;
  final int? initialChosenIndex;
  final Function(int)? chooseOptionFunction;
  final List<int>? initialChosenIndexes;
  final Function(List<int>)? chooseMultipleOptionFunction;

  ChooseOptionDialog(
      {super.key,
      required this.title,
      required this.options,
      required this.onSave,
      required this.height,
      this.initialChosenIndex,
      this.chooseOptionFunction,
      this.initialChosenIndexes,
      this.chooseMultipleOptionFunction});

  late bool isMultipleSelected = initialChosenIndexes != null;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: DialogTitle(title: title),
      content: SizedBox(
        height: height,
        width: 200,
        child: isMultipleSelected
              ? CustomToggleButton(
                  options: options,
                  initialChosenIndexes: initialChosenIndexes,
                  chooseMultipleOptionFunction: chooseMultipleOptionFunction,
                )
              : CustomToggleButton(
                  options: options,
                  initialChosenIndex: initialChosenIndex,
                  chooseOptionFunction: chooseOptionFunction,
                ),
      ),
      actions: [
        CustomTextButton(
          title: SettingsTextUtil.okay,
          isBlue: true,
          onPressed: onSave,
        ),
      ],
    );
  }
}
