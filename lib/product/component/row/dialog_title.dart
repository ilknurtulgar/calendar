import 'package:flutter/material.dart';
import '../../constants/util/color_constants.dart';
import '../../constants/util/text_styles.dart';

class DialogTitle extends StatelessWidget {
  final String title;
  final IconData? iconData;
  const DialogTitle({super.key, required this.title, this.iconData});

  final Color color = SurfaceColors.SECONDARY_COLOR;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyles.SMALL.copyWith(color: color),
        ),
        iconData != null
            ? Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Icon(
                  iconData!,
                  color: color,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
