// ignore_for_file: must_be_immutable

import 'package:calendar/core/base/util/color.dart';
import 'package:calendar/product/component/dialog/base_dialog.dart';
import 'package:calendar/product/constants/util/border_radius_constants.dart';
import 'package:flutter/material.dart';
import '../../constants/util/icon_util.dart';
import '../../constants/util/text_util.dart';

class AddFriendDialog extends StatelessWidget {
  final TextEditingController emailController;
  final Function() sendFriendshipRequestFunction;
  AddFriendDialog({
    super.key,
    required this.emailController,
    required this.sendFriendshipRequestFunction});

  Color color = ColorUtility().secondary;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: Center(child: Text(TextUtil.addFriend,style: textStyle(true),)),
      content: friendEmailTextfield(),
      actions: [sendRequestTextButton()],
    );
  }

  SizedBox friendEmailTextfield() {
    return SizedBox(
      width: 258,
      child: TextField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: TextUtil.email,
          hintStyle: textStyle(false),
          prefixIcon: IconUtil.email,
          prefixIconColor: color,
          enabledBorder: border(),
          focusedBorder: border(),
          border: border(),
        ),
      ),
    );
  }

  OutlineInputBorder border() => OutlineInputBorder(borderRadius: AppBorderRadius.GENERAL,borderSide: BorderSide(color: color));

  TextButton sendRequestTextButton() {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        alignment: Alignment.centerRight,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: sendFriendshipRequestFunction,
      child: Text(TextUtil.sendRequest,style: textStyle(false),),
    );
  }

  TextStyle textStyle(bool isBig) => TextStyle(fontSize: isBig ? 21 : 16,color: color);
}