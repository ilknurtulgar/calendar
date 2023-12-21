// ignore_for_file: must_be_immutable

import 'package:calendar/product/component/buttons/drop_down_button/drop_down_button_model/drop_down_button_model.dart';
import 'package:calendar/product/constants/util/box_decoration_util.dart';
import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:calendar/product/constants/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../constants/util/icon_util.dart';

class DropDownButton extends StatelessWidget {
  final List<String> options;
  final String initialValue;
  final Function(String?) onChanged;
  DropDownButton(
      {super.key,
      required this.options,
      required this.initialValue,
      required this.onChanged});

  final DropDownButtonModel _dropDownButtonModel = DropDownButtonModel();

  @override
  Widget build(BuildContext context) {
    _dropDownButtonModel.chosenValue.value = initialValue;
    return Container(
      height: 35,
      decoration: BoxDecorationUtil.generalBoxDecoration,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: Observer(
            builder: (_) => DropdownButton<String>(
              value: _dropDownButtonModel.chosenValue.value,
              isDense: true,
              padding: EdgeInsets.zero,
              elevation: 24,
              focusColor: SurfaceColors.HOVER_COLOR,
              style: TextStyles.SMALL_SECONDARY,
              focusNode: FocusNode(),
              icon: const Icon(IconUtil.down,color: SurfaceColors.SECONDARY_COLOR,),
              items: options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: TextStyles.SMALL_SECONDARY),
                );
              }).toList(),
              onChanged: (value) {
                _dropDownButtonModel.changeChosenValue(value!);
                onChanged(value);
              },
            ),
          ),
        ),
      ),
    );
  }
}
