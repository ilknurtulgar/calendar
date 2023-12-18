// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../../../../constants/util/color_constants.dart';
import '../../../../constants/util/text_styles.dart';
import '../toggle_button_model/toggle_button_model.dart';

class CustomToggleButton extends StatelessWidget {
  final List<String> options;
  final int? initialChosenIndex;
  final Function(int)? chooseOptionFunction;
  final List<int>? initialChosenIndexes;
  final Function(List<int>)? chooseMultipleOptionFunction;

  CustomToggleButton(
      {super.key,
      required this.options,
      this.initialChosenIndex,
      this.chooseOptionFunction,
      this.initialChosenIndexes,
      this.chooseMultipleOptionFunction});

  final ToggleButtonModel _toggleButtonModel = ToggleButtonModel();
  late bool isMultipleSelected = initialChosenIndexes != null;

  @override
  Widget build(BuildContext context) {
    _toggleButtonModel.length = options.length;
    _toggleButtonModel.chosenIndex.value = initialChosenIndex ?? -1;
    _toggleButtonModel.chosenIndexes = ObservableList.of(initialChosenIndexes ?? []);

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: ((context, index) {
        return InkWell(
          splashColor: SurfaceColors.TRANSPARENT,
          highlightColor: SurfaceColors.TRANSPARENT,
          onTap: () {
            if (isMultipleSelected) {
              _toggleButtonModel.multipleSelectionFunction(index);
              chooseMultipleOptionFunction!(_toggleButtonModel.chosenIndexes);
            } else {
              _toggleButtonModel.oneSelectionFunction(index);
              chooseOptionFunction!(_toggleButtonModel.chosenIndex.value);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 4.5,
                backgroundColor: SurfaceColors.TAB_BORDER_COLOR,
                child: Observer(
                  builder: (_) => CircleAvatar(
                    radius: 3.5,
                    backgroundColor: isMultipleSelected
                        ? _toggleButtonModel.chosenIndexes.contains(index)
                            ? SurfaceColors.SECONDARY_COLOR
                            : SurfaceColors.TAB_BORDER_COLOR
                        : _toggleButtonModel.chosenIndex.value == index
                            ? SurfaceColors.SECONDARY_COLOR
                            : SurfaceColors.TAB_BORDER_COLOR,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  options[index],
                  style: TextStyles.BODY_SECONDARY,
                ),
              )
            ],
          ),
        );
      }),
      separatorBuilder: ((context, index) => const SizedBox(height: 10)),
      itemCount: options.length,
    );
  }
}
