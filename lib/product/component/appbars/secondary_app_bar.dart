import 'package:calendar/product/component/custom_divider.dart';
import 'package:calendar/product/constants/util/text_styles.dart';
import 'package:flutter/material.dart';

import '../../constants/util/color_constants.dart';
import '../../constants/util/icon_util.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SecondaryAppBar({super.key, required this.onPressed});
  final Function() onPressed;
  @override
  Size get preferredSize => const Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      bottom: customDivider(),
      backgroundColor: SurfaceColors.backgroundColor,
      leading: IconUtil.arrowBackButton(onPressed),
      title: const Text(
        " Eyül 2023",
        style: TextStyles.MEDIUM_SECONDARY,
      ),
    );
  }
}
