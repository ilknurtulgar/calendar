// ignore_for_file: must_be_immutable

import 'package:calendar/core/base/base_state/base_state.dart';
import 'package:calendar/product/constants/util/icon_util.dart';
import 'package:calendar/product/constants/util/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../text_obscurity/text_obscurity.dart';

enum TextfieldType { email, password, userName, phone }

class CustomTextfield extends StatelessWidget {
  final TextEditingController textController;
  final TextfieldType type;

  CustomTextfield({
    super.key,
    required this.textController,
    required this.type,
  });

  TextObscurity textObscurity = TextObscurity();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dynamicWidth(context, 37),vertical: dynamicHeight(context, 18)),
      child: SizedBox(
        height: dynamicHeight(context, 50),
        child: Observer(
          builder: (_) => TextFormField(
              controller: textController,
              obscureText: textObscurity.obscureText(type).value,
              keyboardType: keyboardType,
              decoration: inputDecoration()),
        ),
      ),
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
                enabledBorder: border(),
                focusedBorder: border(),
                border: border(),
                filled: true,
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: const TextStyle(fontSize: 16, color: Color(0xffD9D9D9)),
                prefixIcon: prefixIcon,
                prefixIconColor: const Color(0xff084C61),
                suffixIcon: suffixIcon,
                suffixIconColor: const Color(0xff084C61));
  }

  String get hintText {
    switch (type) {
      case TextfieldType.email:
        return TextUtil.email;
      case TextfieldType.password:
        return TextUtil.password;
      case TextfieldType.userName:
        return TextUtil.userName;
      case TextfieldType.phone:
        return TextUtil.phone;
    }
  }

  Icon get prefixIcon {
    switch (type) {
      case TextfieldType.email:
        return IconUtil.email;
      case TextfieldType.password:
        return IconUtil.lock;
      case TextfieldType.userName:
        return IconUtil.account;
      case TextfieldType.phone:
        return IconUtil.phone;
    }
  }

  TextInputType get keyboardType {
    switch (type) {
      case TextfieldType.email:
        return TextInputType.emailAddress;
      case TextfieldType.phone:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  Widget get suffixIcon => type == TextfieldType.password
      ? visibilityIcon()
      : const SizedBox.shrink();

  Widget visibilityIcon() {
    return Observer(
      builder: (_) => IconButton(
        onPressed: () => textObscurity.changeVisibility(),
        icon: textObscurity.passwordObscurity.value
            ? IconUtil.visibilityOff
            : IconUtil.visibility,
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Color(0xff084C61), width: 2),
    );
  }
}
