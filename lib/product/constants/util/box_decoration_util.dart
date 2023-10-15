import 'package:flutter/material.dart';
import '../../../core/base/util/color.dart';
import 'border_radius_constants.dart';

class BoxDecorationUtil {
  static BoxDecoration generalBoxDecoration = BoxDecoration(
      border: Border.all(color: ColorUtility().secondary),
      borderRadius: AppBorderRadius.GENERAL);
}
