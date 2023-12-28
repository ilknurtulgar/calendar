import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:calendar/product/constants/util/text_styles.dart';
import 'package:flutter/material.dart';

class TitleWithDivider extends StatelessWidget {
  final String title;
  const TitleWithDivider({super.key,required this.title});
  
  final Color color = SurfaceColors.SECONDARY_COLOR;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5,bottom: 5),
          child: Text(title,style: TextStyles.SMALL.copyWith(color: color),),
        ),
        Container(height: 1,color: color,),
      ],
    );
  }
}
