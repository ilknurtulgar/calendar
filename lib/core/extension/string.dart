import 'package:flutter/material.dart';

extension StringExtension on String {
  Color get toColor => Color(int.parse('FF${toUpperCase().replaceAll('#', '')}', radix: 16));
}