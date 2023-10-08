import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isWhite;
  final Function() onTap;
  const CustomButton({Key? key, this.isWhite = true, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isWhite ? Colors.white : Colors.pink,
          border: Border.all(color: isWhite ? Colors.pink : Colors.white),
        ),
        child: Center(
          child: Text(
            "Takvim Oluştur",
            style: TextStyle(color: isWhite ? Colors.pink : Colors.white),
          ),
        ),
      ),
    );
  }
}

//TODO color vb özellikler temadan çekilecek