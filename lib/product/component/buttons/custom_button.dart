import 'package:calendar/core/base/util/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isGreen;
  final Function() onTap;
  final String title;
  const CustomButton({Key? key, this.isGreen = false, required this.onTap, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isGreen ? ColorUtility().onSecondary : ColorUtility().primary,
          border: Border.all(color: isGreen ? ColorUtility().secondary : ColorUtility().onPrimary),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: ColorUtility().hover),
          ),
        ),
      ),
    );
  }
}

//TODO color vb özellikler temadan çekilecek