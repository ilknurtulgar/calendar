import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:calendar/product/constants/util/text_styles.dart';
import 'package:flutter/material.dart';

class CurrentDayButton extends StatelessWidget {
  const CurrentDayButton({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          height: 30,
          width: 30,
          decoration: currentDayDecoration(),
          child: const Center(
            child: Text(
              DummyInfo.day,
              style: TextStyles.SUBTITLE,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration currentDayDecoration() {
    return BoxDecoration(
      color: SurfaceColors.PRIMARY_COLOR,
      border: Border.all(
          color: SurfaceColors.ON_PRIMARY_COLOR,
          width: 1,
          strokeAlign: BorderSide.strokeAlignCenter),
      borderRadius: BorderRadius.circular(5),
    );
  }
}

class DummyInfo {
  static const String day = "1";
}
