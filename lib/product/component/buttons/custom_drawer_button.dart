import 'package:calendar/core/base/util/color.dart';
import 'package:flutter/material.dart';

class CustomDrawerButton extends StatelessWidget {
  final bool isWhite;
  final Function() onTap;
  const CustomDrawerButton({Key? key, this.isWhite = true, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isWhite ? Colors.white : ColorUtility().onPrimary,
          border: Border.all(color: isWhite ? ColorUtility().onPrimary : ColorUtility().hover),
        ),
        child: Center(
          child: Text(
            "Takvim Oluştur",
            style: TextStyle(color: isWhite ? ColorUtility().onPrimary : ColorUtility().hover),
          ),
        ),
      ),
    );
  }
}

//TODO color vb özellikler temadan çekilecek