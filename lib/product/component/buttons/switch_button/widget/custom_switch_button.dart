// ignore_for_file: must_be_immutable

import 'package:calendar/product/component/buttons/switch_button/switch_on_off/switch_on_off.dart';
import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomSwitchButton extends StatelessWidget {
  final bool initialValue;
  final Function(bool isOn) switchFunction;
  CustomSwitchButton({super.key,required this.initialValue ,required this.switchFunction});

  final SwitchOnOff _switchOnOff = SwitchOnOff();

  @override
  Widget build(BuildContext context) {
    _switchOnOff.isOn.value = initialValue;
    return InkWell(
      onTap: () {
        _switchOnOff.turnOnOff();
        switchFunction(_switchOnOff.isOn.value);
      },
      child: Container(
        height: 23,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: SurfaceColors.SECONDARY_COLOR, width: 1),
          color: SurfaceColors.ON_SECONDARY_COLOR,
        ),
        child: Observer(
          builder: (_) => AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInQuint,
            alignment: _switchOnOff.isOn.value
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.all(3),
              child: CircleAvatar(
                      backgroundColor: SurfaceColors.SECONDARY_COLOR,
                      radius: 7.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
