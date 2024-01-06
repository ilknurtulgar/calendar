import 'package:flutter/material.dart';

import '../../constants/util/text_styles.dart';
import '../buttons/switch_button/widget/custom_switch_button.dart';

class SwitchRow extends StatelessWidget {
  final String title;
  final bool initialValue;
  final Function(bool isOn) switchFunction;
  const SwitchRow({super.key,required this.initialValue ,required this.title,required this.switchFunction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyles.MEDIUM_SECONDARY),
        CustomSwitchButton(
          initialValue: initialValue,
          switchFunction: switchFunction),
      ],
    );
  }
}
