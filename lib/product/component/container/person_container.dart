import 'package:calendar/core/base/util/color.dart';
import 'package:calendar/product/constants/util/box_decoration_util.dart';
import 'package:calendar/product/constants/util/icon_util.dart';
import 'package:flutter/material.dart';

class PersonContainer extends StatelessWidget {
  final String name;
  final Function() removePersonFunction;
  const PersonContainer(
      {super.key, required this.name, required this.removePersonFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      decoration: BoxDecorationUtil.generalBoxDecoration,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        leading: IconUtil.person,
        minLeadingWidth: 23,
        horizontalTitleGap: 15,
        iconColor: ColorUtility().secondary,
        title: Text(name,style: TextStyle(color: ColorUtility().secondary, fontSize: 21),),
        trailing: deleteButton(),
      ),
    );
  }

  IconButton deleteButton() {
    return IconButton(
        onPressed: removePersonFunction,
        icon: IconUtil.delete,
        color: ColorUtility().onPrimary,
        padding: EdgeInsets.zero,
        alignment: Alignment.centerRight,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      );
  }
}
