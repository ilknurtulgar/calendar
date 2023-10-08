import 'package:calendar/core/extension/string.dart';
import 'package:flutter/material.dart';

class ColorUtility {
  Color get secondary => _secondary.toColor;
  Color get primary => _primary.toColor;
  Color get dark => _dark.toColor;
  Color get onSecondary => _onSecondary.toColor;
  Color get onPrimary => _onPrimary.toColor;
  Color get background => _background.toColor;
  Color get hover => _hover.toColor;
  String get _secondary => '084C61';
  String get _primary => 'F97173';
  String get _onPrimary => 'D6555B';
  String get _onSecondary => '89B0AE';
  String get _background => 'F7F7F7';
  String get _hover => '000000';
  String get _dark => 'FFFFFF';
}
