import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:flutter/material.dart';

class IconUtil {
  static const Icon email = Icon(Icons.email_outlined);
  static const Icon lock = Icon(Icons.lock_outline);
  static const Icon account = Icon(Icons.account_circle_outlined);
  static const Icon phone = Icon(Icons.phone_outlined);
  static const Icon visibility = Icon(Icons.visibility_outlined);
  static const Icon visibilityOff = Icon(Icons.visibility_off_outlined);
  static const Icon close = Icon(Icons.close);
  static const Icon arrowBack = Icon(Icons.arrow_back);
  static const Icon menu = Icon(Icons.menu, color: SurfaceColors.SECONDARY_COLOR);
  static const Icon notification = Icon(Icons.notifications_none, color: SurfaceColors.SECONDARY_COLOR);
  static const Icon moreVert =  Icon(Icons.more_vert, color: SurfaceColors.SECONDARY_COLOR);
  static const Icon search = Icon(Icons.search, color: SurfaceColors.SECONDARY_COLOR);
  static const Icon person = Icon(Icons.person_outline);
  static const Icon delete = Icon(Icons.delete_outline);

  
  static IconButton arrowBackButton(Function() onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: IconUtil.arrowBack,
      color: SurfaceColors.SECONDARY_COLOR,
    );
  }
}
