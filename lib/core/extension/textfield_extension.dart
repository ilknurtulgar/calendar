import 'package:calendar/product/constants/util/error_message_util.dart';
import 'package:flutter/material.dart';
import '../../product/component/text_form_field/widget/custom_text_form_field.dart';
import '../../product/constants/util/icon_util.dart';
import '../../product/constants/util/text_util.dart';

extension TextfieldExtension on TextfieldType {
  String get hintText {
    switch (this) {
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
    switch (this) {
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
    switch (this) {
      case TextfieldType.email:
        return TextInputType.emailAddress;
      case TextfieldType.phone:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  String? Function(String?) get validator{
    switch (this) {
      case TextfieldType.email:
        return emailValidator;
      case TextfieldType.password:
        return passwordValidator;
      case TextfieldType.userName:
        return userNameValidator;
      case TextfieldType.phone:
        return phoneValidator;
    }
  }
}

String? userNameValidator(String? value) {
  if (value!.length < 6) {
    return ErrorMessageUtil.shortUserName;
  } else {
    return null;
  }
}

String? passwordValidator(String? value) {
  if (value!.length < 8) {
    return ErrorMessageUtil.shortPassword;
  } else {
    return null;
  }
}

String? emailValidator(String? value) {
  String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty){
      return ErrorMessageUtil.emptyEmail;
  } else if(!regExp.hasMatch(value)) {
      return ErrorMessageUtil.invalidEmail;
  } else{
      return null;
  }
}

String? phoneValidator(String? value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(patttern);
  if (value!.isEmpty) {
      return ErrorMessageUtil.emptyPhone;
  } else if (!regExp.hasMatch(value)) {
      return ErrorMessageUtil.invalidPhone;
  } else {
      return null;
  }
}