// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:calendar/core/base/base_state/base_state.dart';
import 'package:calendar/core/extension/textfield_extension.dart';
import 'package:calendar/product/constants/util/icon_util.dart';
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
    return SizedBox(
      height: dynamicHeight(context, 63),
      child: Observer(
        builder: (_) => TextFormField(
            controller: textController,
            validator: (value) => type.validator(value),
            onSaved: (value) => textController.text = value!,
            obscureText: textObscurity.obscureText(type).value,
            keyboardType: type.keyboardType,
            decoration: inputDecoration()),
      ),
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
        enabledBorder: border(),
        focusedBorder: border(),
        border: border(),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        filled: true,
        fillColor: Colors.white,
        hintText: type.hintText,
        hintStyle: const TextStyle(fontSize: 16, color: Color(0xffD9D9D9)),
        prefixIcon: type.prefixIcon,
        prefixIconColor: const Color(0xff084C61),
        suffixIcon: suffixIcon,
        suffixIconColor: const Color(0xff084C61));
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