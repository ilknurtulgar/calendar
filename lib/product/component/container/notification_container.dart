import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:flutter/material.dart';
import '../../constants/util/text_styles.dart';

class NotificationContainer extends StatelessWidget {
  final IconData iconData;
  final String notification;
  final DateTime date;
  final String time;
  final Function() onPressed;
  
  const NotificationContainer(
      {super.key,
      required this.iconData,
      required this.notification,
      required this.date,
      required this.time,
      required this.onPressed});

  String get dateText => "${date.day}/${date.month}/${date.year}";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: SurfaceColors.HOVER_COLOR,
          border: Border.symmetric(horizontal: BorderSide(color: SurfaceColors.ON_SECONDARY_COLOR, width: 1)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Row(
           mainAxisSize: MainAxisSize.min,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: SurfaceColors.SECONDARY_COLOR,
              child: CircleAvatar(
                radius: 17,
                backgroundColor: SurfaceColors.HOVER_COLOR,
                child: Icon(
                  iconData,
                  size: 25,
                  color: SurfaceColors.SECONDARY_COLOR,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification, style: TextStyles.SMALL_SECONDARY),
                Text("$dateText $time",style: TextStyles.BODY.copyWith(color: SurfaceColors.SECONDARY_COLOR)),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
