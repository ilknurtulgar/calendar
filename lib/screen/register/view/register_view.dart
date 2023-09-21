import 'package:flutter/material.dart';
import 'package:calendar/core/base/view/base_view.dart';
import 'package:calendar/core/base/base_state/base_state.dart';
import 'package:calendar/product/component/buttons/custom_filled_button.dart';
import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:calendar/product/constants/util/icon_util.dart';
import 'package:calendar/product/constants/util/text_util.dart';
import '../../../product/component/text_form_field/widget/custom_text_form_field.dart';
import '../../../product/constants/util/text_styles.dart';
import '../view_model/register_view_model.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
        viewModel: RegisterViewModel(),
        onPageBuilder: ((context, model) {
          return Scaffold(
              backgroundColor: SurfaceColors.backgroundColor,
              appBar: appBar(context),
              body: Form(
                key: model.formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: dynamicWidth(context, 37)) + EdgeInsets.only(top: dynamicHeight(context, 90),bottom: dynamicHeight(context, 86)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(TextUtil.createNewAccount,style: const TextStyle(fontSize: 28.4),), // text style util'inden mi alınacak yoksa bu stilde mi kalacak?
                      const Spacer(),
                      textfieldList(context, model),
                      registerButton(context,model),
                      alreadyHaveAccountRow()
                    ],
                  ),
                ),
              ));
        }));
  }

  Row alreadyHaveAccountRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(TextUtil.alreadyHaveAccount,style: const TextStyle(fontSize: 16),), // small text style rengi beyaz olduğu için böyle bıraktım
        TextButton(
          onPressed: () {},
          child: Text(TextUtil.login,
              style: const TextStyle(fontSize: 16, color: SurfaceColors.ON_PRIMARY_COLOR),
              textAlign: TextAlign.left),
        ),
      ],
    );
  }

  Padding registerButton(BuildContext context, RegisterViewModel model) {
    return Padding(
      padding: EdgeInsets.only(top: dynamicHeight(context,92), bottom: dynamicHeight(context,40)),
      child: CustomFilledButton(
        backgroundColor: SurfaceColors.PRIMARY_COLOR,
        text: TextUtil.register,
        textStyle: TextStyles.SMALL,
        shouldCoverHorizontal: true,
        onTap: ()=> model.save(context),
      ),
    );
  }

  SizedBox textfieldList(BuildContext context,RegisterViewModel model) {
    return SizedBox(
      height: dynamicHeight(context,320),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: model.registerTextfieldTypes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: index != model.registerTextfieldTypes.length - 1
                ? EdgeInsets.only(bottom: dynamicHeight(context, 23))
                : EdgeInsets.zero,
            child: CustomTextfield(
              textController: model.textControllers[index],
              type: model.registerTextfieldTypes[index],
            ),
          );
        },
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: dynamicHeight(context,80),
      elevation: 0,
      leading: closeButton(context),
      leadingWidth: 100,
    );
  }

  IconButton closeButton(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.only(top: dynamicHeight(context, 36), left: dynamicWidth(context, 37)),
      icon: IconUtil.close,
      color: SurfaceColors.ON_PRIMARY_COLOR,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      iconSize: 50,
      alignment: Alignment.centerLeft,
      onPressed: () => Navigator.pop(context),
    );
  }
}
