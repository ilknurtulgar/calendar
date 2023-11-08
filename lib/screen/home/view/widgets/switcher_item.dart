import 'package:calendar/core/base/util/color.dart';
import 'package:flutter/material.dart';

class SwitcherItem extends StatelessWidget {
  const SwitcherItem({
    super.key,
    this.isSwitched = false,
    required this.onPressed,
    required this.text,
  });

  final bool isSwitched;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            isSwitched ? ColorUtility().primary : ColorUtility().hover,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: SizedBox(
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: ColorUtility().dark,
                fontSize: 11,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
