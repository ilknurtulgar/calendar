import 'package:calendar/core/base/view/base_view.dart';
import 'package:calendar/product/component/buttons/icon_button.dart';
import 'package:calendar/product/component/container/friendship_request_container.dart';
import 'package:calendar/product/component/container/invitation_container.dart';
import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:flutter/material.dart';
import '../../../product/constants/util/icon_util.dart';
import '../../../product/constants/util/text_styles.dart';
import '../../../product/constants/util/text_util.dart';
import '../view_model/notifications_view_model.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<NotificationsViewModel>(
        viewModel: NotificationsViewModel(),
        onPageBuilder: ((context, model) {
          return DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: SurfaceColors.HOVER_COLOR,
                leading: AppIconButton(
                  onPressed: () {},
                  iconData: IconUtil.arrowBack.icon!,
                  size: 30,
                  alignment: Alignment.centerRight,
                ),
                title: Text(
                  TextUtil.notifications,
                  style: TextStyles.LARGE_SECONDARY.copyWith(fontWeight: FontWeight.normal),
                ),
                bottom: TabBar(
                    indicatorColor: SurfaceColors.SECONDARY_COLOR,
                    indicatorWeight: 4,
                    labelColor: Colors.black,
                    labelStyle: TextStyles.MEDIUM_SECONDARY,
                    tabs: [
                      Tab(text: TextUtil.invitations),
                      Tab(text: TextUtil.requests),
                    ]),
              ),
              body: TabBarView(
                children: [
                  ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InvitationContainer(
                          title: "Mobilab Takvim Daveti",
                          invitationText: "Hangi mum yanar ki yatsıya kadar bana söz ver bi yemin et sakla mezara kadar",
                          date: DateTime.now(),
                          time: "21.00",
                          onAccept: () {},
                          onReject: () {},
                        );
                      }),
                  ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return FriendshipRequestContainer(
                            senderName: "Conan Gray",
                            senderEmail: "conangray@gmail.com",
                            senderImageUrl: "https://picsum.photos/100/100",
                            date: DateTime.now(),
                            time: "15.00",
                            onAccept: () {},
                            onReject: () {});
                      }),
                ],
              ),
            ),
          );
        }));
  }
}
