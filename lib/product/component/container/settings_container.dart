import 'package:calendar/product/component/buttons/icon_button.dart';
import 'package:calendar/product/constants/util/box_decoration_util.dart';
import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:calendar/product/constants/util/icon_util.dart';
import 'package:calendar/product/constants/util/text_styles.dart';
import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  final String data;
  final Function() onPressed;
  const SettingsContainer({super.key,required this.data,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecorationUtil.generalBoxDecoration.copyWith(color: SurfaceColors.HOVER_COLOR),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(data,style: TextStyles.SMALL_SECONDARY,),
            AppIconButton(onPressed: onPressed, iconData: IconUtil.forward)
          ]
        ),
      ),
    );
  }
}
