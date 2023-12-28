import 'package:flutter/material.dart';

import '../constants/util/color_constants.dart';

PreferredSize customDivider() {
  return const PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Divider(
        height: 1,
        color: SurfaceColors.SECONDARY_COLOR,
      ));
}
