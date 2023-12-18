// ignore_for_file: must_be_immutable

import 'package:calendar/product/component/list_view/hour_minute_scroll/hour_minute_scroll_model/hour_minute_scroll_model.dart';
import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../constants/util/text_styles.dart';

enum HourMinuteScrollType {
  hour,
  minute,
}

class HourMinuteScroll extends StatelessWidget {
  final HourMinuteScrollType type;
  final Function(int)? onSelectedItemChanged;
  final int initialValue;

  HourMinuteScroll({
    super.key,
    required this.type,
    required this.onSelectedItemChanged,
    required this.initialValue,
  });

  final HourMinuteScrollModel _hourMinuteScrollModel = HourMinuteScrollModel();

  @override
  Widget build(BuildContext context) {
    _hourMinuteScrollModel.changeChosenValue(initialValue);
    return SizedBox(
      width: 29,
      height: 107,
      child: ListWheelScrollView.useDelegate(
        controller: FixedExtentScrollController(initialItem: initialValue),
        onSelectedItemChanged: (value){
          _hourMinuteScrollModel.changeChosenValue(value);
          onSelectedItemChanged!(_hourMinuteScrollModel.chosenValue);
        },
        overAndUnderCenterOpacity: 0.75,
        itemExtent: 20,
        perspective: 0.002,
        diameterRatio: 0.9,
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
            childCount: type == HourMinuteScrollType.hour ? 24 : 60,
            builder: (context, index) {
              return hourMinuteNumberText(index);
            }),
      ),
    );
  }

  Widget hourMinuteNumberText(int index) {
    Color textColor = SurfaceColors.SECONDARY_COLOR;  
    TextStyle bigStyle = TextStyles.SMALL.copyWith(color: textColor,fontWeight: FontWeight.bold);
    TextStyle smallStyle = TextStyles.BODY.copyWith(color: textColor);
    return Observer(
      builder: (_) => Text(
        index < 10 ? '0${index.toString()}' : index.toString(),
        style: index == _hourMinuteScrollModel.chosenValue ? bigStyle : smallStyle,
      ),
    );
  }
}

