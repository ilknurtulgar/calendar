import 'package:flutter/material.dart';

import 'package:calendar/core/base/util/color.dart';

class YearItem extends StatelessWidget {
  const YearItem({
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
    return Container(
      height: 60,
      width: 65,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorUtility().secondary,
          width: 0.4,
        ),
      ),
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
                color: ColorUtility().secondary,
                fontSize: 16,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
        ),
      ),
    );
  }
}
