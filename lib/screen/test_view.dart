import 'package:calendar/product/component/buttons/custom_filled_button.dart';
import 'package:calendar/product/constants/texts/login_text_constants.dart';
import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:calendar/product/constants/util/text_styles.dart';
import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomFilledButton(
          backgroundColor: SurfaceColors.PRIMARY_COLOR,
          borderColor: SurfaceColors.ON_PRIMARY_COLOR,
          shouldCoverHorizontal: true,
          text: LoginTextConstants.LOGIN_BUTTON_TEXT,
          textStyle: TextStyles.SMALL,
          onTap: (){},
        ),
      ),
    );
  }
}
