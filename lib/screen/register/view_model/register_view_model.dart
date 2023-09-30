import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../product/component/text_form_field/widget/custom_text_form_field.dart';
import '../../../core/base/store/base_store.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = RegisterViewModelBase with _$RegisterViewModel;

abstract class RegisterViewModelBase extends BaseStore with Store {
  late TextEditingController userNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode userNameFocusNode;
  late FocusNode phoneFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  @override
  void onInit() {
    userNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userNameFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    userNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    userNameFocusNode.dispose();
    phoneFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<TextfieldType> get registerTextfieldTypes => [
        TextfieldType.userName,
        TextfieldType.phone,
        TextfieldType.email,
        TextfieldType.password
      ];

  List<TextEditingController> get textControllers => [
        userNameController,
        phoneController,
        emailController,
        passwordController
      ];

  void save(BuildContext context) {
    bool isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if(isValid){
      formKey.currentState!.save();
    }
  }
}
