import 'package:calendar/product/component/list_view/hour_minute_scroll/widget/hour_minute_scroll.dart';
import 'package:calendar/product/constants/util/border_radius_constants.dart';
import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:calendar/product/constants/util/text_styles.dart';
import 'package:flutter/material.dart';

class TimeSelectionContainer extends StatelessWidget {
  final int initialHour;
  final Function(int) onHourChanged;
  final int initialMinute;
  final Function(int) onMinuteChanged;
  
  const TimeSelectionContainer({
    super.key,
    required this.initialHour,
    required this.onHourChanged,
    required this.initialMinute,
    required this.onMinuteChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 94,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.GENERAL,
        border: Border.all(color: Colors.black,width: 0.5),
        color: Colors.white,
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            timeScroll(HourMinuteScrollType.hour),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(':',style: TextStyles.SMALL.copyWith(color: SurfaceColors.SECONDARY_COLOR,),),
            ),
            timeScroll(HourMinuteScrollType.minute),
          ],
        ),
      ),
    );
  }

  HourMinuteScroll timeScroll(HourMinuteScrollType type) {
    return HourMinuteScroll(
          type: type,
          onSelectedItemChanged: type == HourMinuteScrollType.hour ? onHourChanged : onMinuteChanged,
          initialValue: type == HourMinuteScrollType.hour ? initialHour : initialMinute);
  }
}
