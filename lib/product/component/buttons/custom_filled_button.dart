import 'package:calendar/core/base/base_state/base_state.dart';
import 'package:calendar/product/constants/util/border_radius_constants.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final double? width;
  final bool? shouldCoverHorizontal;
  final Color backgroundColor;
  final Color? borderColor;
  final String text;
  final TextStyle textStyle;
  final void Function() onTap;

  const CustomFilledButton({
    super.key,
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
    return SizedBox(
      height: dynamicHeight(context, 50),
      child: ClipRRect(
        borderRadius: AppBorderRadius.LARGE,
        child: Material(
          child: InkWell(
            overlayColor: const MaterialStatePropertyAll(Colors.white10),
            onTap: onTap,
            child: Ink(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: AppBorderRadius.LARGE,
                border: Border.all(
                  color: borderColor ?? backgroundColor,
                )
              ),
              width: shouldCoverHorizontal == true ? double.infinity : width,
              child: Center(
                child: Text(
                  text,
                  style: textStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
