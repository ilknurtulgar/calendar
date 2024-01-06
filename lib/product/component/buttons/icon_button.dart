import 'package:flutter/material.dart';

import '../../constants/util/color_constants.dart';

class AppIconButton extends StatelessWidget {
  final Function() onPressed;
  final IconData iconData;
  final Color color;
  final Alignment alignment;
  const AppIconButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    this.color = SurfaceColors.SECONDARY_COLOR,
    this.alignment = Alignment.centerRight,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(iconData),
        iconSize: 20,
        color: color,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: EdgeInsets.zero,
        alignment: alignment,
      );
  }
}
