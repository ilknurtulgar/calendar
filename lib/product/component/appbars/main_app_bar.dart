import 'package:calendar/product/component/buttons/current_day_button.dart';
import 'package:calendar/product/constants/util/border_radius_constants.dart';
import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:calendar/product/constants/util/icon_util.dart';
import 'package:calendar/product/constants/util/padding_constants.dart';
import 'package:flutter/material.dart';

import '../custom_divider.dart';

class CustomMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomMainAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      bottom: customDivider(),
      actions: [
        CurrentDayButton(
          onTap: () {},
        ),
        PopupMenuButton(
          shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.GENERAL),
          itemBuilder: (context) {
            return _dummyListWidget;
          },
          icon: IconUtil.moreVert,
        ),
      ],
      backgroundColor: SurfaceColors.backgroundColor,
      leading: IconButton(onPressed: () {}, icon: IconUtil.menu),
      title: appTitle(),
    );
  }

  Center appTitle() {
    return const Center(
      child: Text(
        " Eyül 2023",
        style: TextStyle(color: TextColors.SECONDARY_COLOR),
      ),
    );
  }
}

final List<PopupMenuEntry<Widget>> _dummyListWidget = [
  dotPopUpMenuItem(
    iconWidget: IconUtil.notification,
    popMenuText: "Bildirimler",
    onTap: () {},
  ),
  dotPopUpMenuItem(
    iconWidget: IconUtil.search,
    popMenuText: "Arama Yap",
    onTap: () {},
  )
];

PopupMenuItem<Widget> dotPopUpMenuItem(
    {required iconWidget,
    required String popMenuText,
    required Function() onTap}) {
  return PopupMenuItem(
      onTap: onTap,
      padding: AppPaddings.GENERAL,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [iconWidget, Text(popMenuText)],
      ));
}
