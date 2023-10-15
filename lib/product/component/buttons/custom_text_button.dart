import 'package:calendar/core/base/util/color.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final bool isGreen;
  final VoidCallback onPressed;

  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isGreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        title,
        style: TextStyle(color: isGreen ? ColorUtility().secondary : ColorUtility().onPrimary),
      ),
    );
  }
}
