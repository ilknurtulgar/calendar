import 'package:calendar/core/base/base_state/base_state.dart';
import 'package:calendar/product/component/buttons/custom_filled_button.dart';
import 'package:calendar/product/component/text_form_field/widget/custom_text_form_field.dart';
import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:calendar/product/constants/util/padding_constants.dart';
import 'package:calendar/product/constants/util/text_styles.dart';
import 'package:calendar/product/constants/util/text_util.dart';
import 'package:calendar/screen/register/view/register_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: AppPaddings.XLARGE_V + AppPaddings.LARGE_H,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildAppName(),
                buildAppLogo(context),
                buildTextfield(
                    context, TextEditingController(), TextfieldType.email),
                buildTextfield(
                    context, TextEditingController(), TextfieldType.password),
                buildLoginButton(),
                buildRegisterNavigation(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildTextfield(BuildContext context,
      TextEditingController controller, TextfieldType type) {
    return SizedBox(
      child: CustomTextfield(
        textController: controller,
        type: type,
      ),
    );
  }

  Image buildAppLogo(BuildContext context) => Image.asset(
        "assets/images/app_logo.png",
        width: dynamicWidth(context, 225),
      );

  Text buildAppName() => const Text("Calendar", style: TextStyles.APPNAME);

  SizedBox buildLoginButton() {
    return SizedBox(
      child: CustomFilledButton(
        backgroundColor: SurfaceColors.PRIMARY_COLOR,
        borderColor: SurfaceColors.ON_PRIMARY_COLOR,
        text: TextUtil.login,
        textStyle: TextStyles.SMALL,
        shouldCoverHorizontal: true,
        onTap: () {},
      ),
    );
  }

  Row buildRegisterNavigation(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          TextUtil.dontHaveAccount,
          style: const TextStyle(fontSize: 16),
        ), // small text style rengi beyaz olduğu için böyle bıraktım
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RegisterView(),
            ));
          },
          child: Text(TextUtil.register,
              style: const TextStyle(
                  fontSize: 16, color: SurfaceColors.ON_PRIMARY_COLOR),
              textAlign: TextAlign.left),
        )
      ],
    );
  }
}
