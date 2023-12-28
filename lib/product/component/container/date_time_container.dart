import 'package:calendar/core/base/base_state/base_state.dart';
import 'package:calendar/product/component/list_view/hour_minute_scroll/widget/hour_minute_scroll.dart';
import 'package:flutter/material.dart';

import '../../constants/util/color_constants.dart';

class DateandTimeContainer extends BaseStateless {
  const DateandTimeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTime = false;
    return Center(
      child: SizedBox(
        width: width(context) * 3 / 4,
        child: Column(
          children: [
            Row(
              children: [
                selectContainer(30, 70, const Radius.circular(10), const Radius.circular(10), Radius.zero, Radius.zero, title("Tarih"), bottom: BorderSide.none, onTap: () {
                  isTime = false;
                }),
                selectContainer(30, 70, const Radius.circular(10), const Radius.circular(10), Radius.zero, Radius.zero, title("Saat"), bottom: BorderSide.none, onTap: () {
                  isTime = true;
                }),
              ],
            ),
            selectContainer(
              height(context) / 4,
              width(context) * 3 / 4,
              Radius.zero,
              const Radius.circular(20),
              const Radius.circular(20),
              const Radius.circular(20),
              isTime == true ? setTimeMethod() : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Row setTimeMethod() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HourMinuteScroll(type: HourMinuteScrollType.hour, onSelectedItemChanged: (p0) {}, initialValue: 0),
        const Text(":"),
        HourMinuteScroll(type: HourMinuteScrollType.minute, onSelectedItemChanged: (p0) {}, initialValue: 0),
      ],
    );
  }

  InkWell selectContainer(
    double height,
    double width,
    Radius topLeft,
    Radius topRight,
    Radius bottomRight,
    Radius bottomLeft,
    Widget child, {
    Function()? onTap,
    BorderSide top = const BorderSide(width: 1.0, color: SurfaceColors.SECONDARY_COLOR),
    BorderSide bottom = const BorderSide(width: 1.0, color: SurfaceColors.SECONDARY_COLOR),
    BorderSide left = const BorderSide(width: 1.0, color: SurfaceColors.SECONDARY_COLOR),
    BorderSide right = const BorderSide(width: 1.0, color: SurfaceColors.SECONDARY_COLOR),
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
              top: top,
              left: left,
              right: right,
              bottom: bottom,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight)),
        height: height,
        width: width,
        child: child,
      ),
    );
  }

  Center title(String text) => Center(child: Text(text));
}
