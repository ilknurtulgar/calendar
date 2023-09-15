import 'package:calendar/product/constants/util/border_radius_constants.dart';
import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:calendar/product/constants/util/padding_constants.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final double? height;
  final double? width;
  final bool? shouldCoverHorizontal;
  final Color backgroundColor;
  final Color? borderColor;
  final String text;
  final TextStyle textStyle;
  final void Function() onTap;

  const CustomFilledButton({
    super.key,
    this.height,
    this.width,
    this.borderColor,
    this.shouldCoverHorizontal,
    required this.backgroundColor,
    required this.text,
    required this.textStyle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: AppPaddings.MEDIUM_V + AppPaddings.LARGE_H,
          width: shouldCoverHorizontal == true ? double.infinity : width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: AppBorderRadius.LARGE,
            border: Border.all(
              color: borderColor ?? backgroundColor,
            ),
          ),
          child: Text(
            text,
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
