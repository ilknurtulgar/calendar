import 'package:calendar/core/base/util/color.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final double textSize;
  final bool isBlue;
  final bool isItalic;
  final VoidCallback onPressed;

  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.textSize = 12,
    this.isBlue = false,
    this.isItalic = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        title,
        style: TextStyle(
            fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
            color: isBlue ? ColorUtility().secondary : ColorUtility().onPrimary,
            fontSize: textSize
          ),
      ),
    );
  }
}
