import 'package:calendar/product/component/container/notification_container.dart';
import 'package:calendar/product/constants/util/box_decoration_util.dart';
import 'package:flutter/material.dart';

import '../../constants/util/color_constants.dart';
import '../../constants/util/icon_util.dart';
import '../../constants/util/text_styles.dart';
import '../../constants/util/text_util.dart';
import '../buttons/custom_text_button.dart';
import '../dialog/base_dialog.dart';

class FriendshipRequestContainer extends StatelessWidget {
  final String senderName;
  final String senderImageUrl;
  final String senderEmail;
  final DateTime date;
  final String time;
  final Function() onAccept;
  final Function() onReject;
  const FriendshipRequestContainer(
      {super.key,
      required this.senderName,
      required this.senderEmail,
      required this.senderImageUrl,
      required this.date,
      required this.time,
      required this.onAccept,
      required this.onReject});

  @override
  Widget build(BuildContext context) {
    return NotificationContainer(
      iconData: IconUtil.personAdd,
      notification: "$senderName arkadaşlık isteği gönderdi.",
      date: date,
      time: time,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return BaseDialog(
                title: Center(child: Text(TextUtil.friendshipRequest,style: TextStyles.MEDIUM.copyWith(color: SurfaceColors.SECONDARY_COLOR,fontWeight: FontWeight.normal))),
                content: Container(
                  decoration: BoxDecorationUtil.generalBoxDecoration,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(senderImageUrl),
                    ),
                    title: Text(senderName, style: TextStyles.SMALL_SECONDARY),
                    titleAlignment: ListTileTitleAlignment.center,
                    subtitle: Text(
                      senderEmail,
                      style: TextStyles.BODY.copyWith(color: SurfaceColors.SECONDARY_COLOR),
                    ),
                    horizontalTitleGap: 10,
                    minLeadingWidth: 30,
                    minVerticalPadding: 0,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10)
                  ),
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

  CustomTextButton acceptRejectTextButton(bool isForAccept) {
    return CustomTextButton(
                  title: isForAccept ? TextUtil.accept : TextUtil.reject,
                  textSize: 16,
                  isBlue: isForAccept,
                  onPressed: isForAccept ? onAccept : onReject,
                );
  }
}
