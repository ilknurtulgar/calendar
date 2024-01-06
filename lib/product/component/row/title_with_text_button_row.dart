import 'package:flutter/material.dart';

import '../../constants/util/text_styles.dart';
import '../buttons/custom_text_button.dart';

class TitleWithTextButton extends StatelessWidget {
  final String title;
  final String buttontext;
  final Function() onPressed;
  
  const TitleWithTextButton(
      {super.key,
      required this.title,
      required this.buttontext,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyles.MEDIUM_SECONDARY,
        ),
        CustomTextButton(
            title: buttontext,
            isBlue: true,
            isBig: true,
            isItalic: true,
            onPressed: onPressed)
      ],
    );
  }
}
