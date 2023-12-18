import 'package:calendar/product/component/container/settings_container.dart';
import 'package:flutter/material.dart';

import '../../constants/util/text_styles.dart';

class SettingsColumn extends StatelessWidget {
  final String title;
  final String data;
  final Function() onPressed;
  const SettingsColumn({super.key,required this.title,required this.data,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: Text(title,style: TextStyles.MEDIUM_SECONDARY,),
        ),
        SettingsContainer(
          data: data,
          onPressed: onPressed,
        )
      ],
    );
  }
}
