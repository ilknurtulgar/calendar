import 'package:calendar/product/component/buttons/custom_text_button.dart';
import 'package:calendar/product/component/container/notification_container.dart';
import 'package:calendar/product/component/dialog/base_dialog.dart';
import 'package:calendar/product/constants/util/box_decoration_util.dart';
import 'package:calendar/product/constants/util/text_util.dart';
import 'package:flutter/material.dart';

import '../../constants/util/color_constants.dart';
import '../../constants/util/icon_util.dart';
import '../../constants/util/text_styles.dart';

class InvitationContainer extends StatelessWidget {
  final String title;
  final String invitationText;
  final DateTime date;
  final String time;
  final Function() onAccept;
  final Function() onReject;

  const InvitationContainer(
      {super.key,
      required this.title,
      required this.invitationText,
      required this.date,
      required this.time,
      required this.onAccept,
      required this.onReject});

  TextStyle get textStyle => TextStyles.SMALL_SECONDARY;
  String get dateText => "${date.day}/${date.month}/${date.year}";

  @override
  Widget build(BuildContext context) {
    return NotificationContainer(
      iconData: IconUtil.email.icon!,
      notification: title,
      date: date,
      time: time,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return BaseDialog(
                title: Center(child: Text(title,style: TextStyles.MEDIUM.copyWith(color: SurfaceColors.SECONDARY_COLOR,fontWeight: FontWeight.normal))),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    invitationDateColumn(true),
                    const SizedBox(height: 33,),
                    invitationDateColumn(false)
                  ],
                ),
                actions: [
                  acceptRejectTextButton(false),
                  acceptRejectTextButton(true),
                ],
              );
            });
      },
    );
  }

  Column invitationDateColumn(bool isForInvitation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(isForInvitation ? "${TextUtil.meetingTopic}:" : "${TextUtil.date}:",style: textStyle)),
        Container(
            decoration: BoxDecorationUtil.generalBoxDecoration,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: isForInvitation
                  ? Text(
                      invitationText,
                      style: textStyle,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        dateTimeRow(true),
                        dateTimeRow(false),
                      ],
                    ),
            )),
      ],
    );
  }

  Row dateTimeRow(bool isForDate) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isForDate ? IconUtil.calendar : IconUtil.schedule,
          size: 20,
          color: SurfaceColors.SECONDARY_COLOR,
        ),
        const SizedBox(width: 10),
        Text(isForDate ? dateText : time,style: textStyle)
      ],
    );
  }

  CustomTextButton acceptRejectTextButton(bool isForAccept) {
    return CustomTextButton(
                  title: isForAccept ? TextUtil.accept : TextUtil.reject,
                  textSize: 16,
                  isBlue: isForAccept,
                  onPressed: isForAccept ? onAccept : onReject,
                );
  }
}
