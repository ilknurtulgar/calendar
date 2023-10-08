import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

abstract class BaseState<T extends StatefulWidget, M extends Store> extends State<T> {
  BaseState({
    Key? key,
  });

  ThemeData get themeData => Theme.of(context);

  ColorScheme get colorScheme => Theme.of(context).colorScheme;

  TextTheme get textTheme => Theme.of(context).textTheme;

  double get height => MediaQuery.of(context).size.height;

  double get width => MediaQuery.of(context).size.width;

  double get topPadding => MediaQuery.of(context).padding.top;

  double get bottomPadding => MediaQuery.of(context).padding.bottom;

  double dynamicHeight(double value) => (height - topPadding - bottomPadding) / 932 * value; // design height

  double dynamicWidth(double value) => width / 430 * value; // design width
}

abstract class BaseStateless extends StatelessWidget {
  const BaseStateless({Key? key}) : super(key: key);

  ThemeData themeData(BuildContext context) => Theme.of(context);

  ColorScheme colorScheme(BuildContext context) => Theme.of(context).colorScheme;

  DividerThemeData dividerTheme(BuildContext context) => Theme.of(context).dividerTheme;

  TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;

  double height(BuildContext context) => MediaQuery.of(context).size.height;

  double width(BuildContext context) => MediaQuery.of(context).size.width;

  double topPadding(BuildContext context) => MediaQuery.of(context).padding.top;

  double bottomPadding(BuildContext context) => MediaQuery.of(context).padding.bottom;

  double dynamicHeight(BuildContext context, double value) => (height(context) - topPadding(context) - bottomPadding(context)) / 932 * value; // design height

  double dynamicWidth(BuildContext context, double value) => width(context) / 430 * value; // design width
}

extension BaseStateExtension on State {
  DividerThemeData get dividerTheme => Theme.of(context).dividerTheme;

  ThemeData get themeData => Theme.of(context);

  ColorScheme get colorScheme => Theme.of(context).colorScheme;

  TextTheme get textTheme => Theme.of(context).textTheme;

  double height(BuildContext context) => MediaQuery.of(context).size.height;

  double width(BuildContext context) => MediaQuery.of(context).size.width;

  double topPadding(BuildContext context) => MediaQuery.of(context).padding.top;

  double bottomPadding(BuildContext context) => MediaQuery.of(context).padding.bottom;


  double dynamicHeight(BuildContext context, double value) =>
      (height(context) - topPadding(context) - bottomPadding(context)) /
      844 *
      value; // design height

  double dynamicWidth(BuildContext context, double value) =>
      width(context) / 390 * value; // design width
}

extension StatelessExtension on StatelessWidget {
  ThemeData themeData(BuildContext context) => Theme.of(context);

  ColorScheme colorScheme(BuildContext context) => Theme.of(context).colorScheme;

  DividerThemeData dividerTheme(BuildContext context) => Theme.of(context).dividerTheme;

  TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;

  double height(BuildContext context) => MediaQuery.of(context).size.height;

  double width(BuildContext context) => MediaQuery.of(context).size.width;

  double topPadding(BuildContext context) => MediaQuery.of(context).padding.top;

  double bottomPadding(BuildContext context) => MediaQuery.of(context).padding.bottom;

  double dynamicHeight(BuildContext context, double value) =>
      (height(context) - topPadding(context) - bottomPadding(context)) /
      844 *
      value; // design height

  double dynamicWidth(BuildContext context, double value) =>
      width(context) / 390 * value; // design width
}
