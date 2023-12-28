import 'package:calendar/core/base/base_state/base_state.dart';
import 'package:calendar/product/constants/util/padding_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../constants/util/color_constants.dart';

enum CustomTextfieldType { title, detail }

class CustomTextInputField extends StatelessWidget {
  final TextEditingController textController;
  final double heightValue;

  const CustomTextInputField({super.key, required this.textController, this.heightValue = 63});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.GENERAL,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: SurfaceColors.SECONDARY_COLOR), borderRadius: BorderRadius.circular(10)),
        height: dynamicHeight(context, heightValue),
        child: Observer(
          builder: (_) => TextFormField(
            controller: textController,
            onSaved: (value) => textController.text = value!,
          ),
        ),
      ),
    );
    ;
  }
}
