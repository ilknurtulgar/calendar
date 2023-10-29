import 'package:calendar/product/component/container/person_container.dart';
import 'package:calendar/product/component/dialog/add_friend_dialog.dart';
import 'package:calendar/product/component/dialog/message_dialog.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PersonContainer(
                  name: "Gizem Göksu",
                  removePersonFunction: (() => showDialog(
                      context: context,
                      builder: (context) => MessageDialog(
                          message:
                              "Yaptığınız değişiklikler silinecektir.Kabul ediyor musunuz?",
                          acceptFunction: (() {}))))),
              PersonContainer(
                  name: "Gizem Göksu",
                  removePersonFunction: (() => showDialog(
                      context: context,
                      builder: (context) => AddFriendDialog(
                        emailController: TextEditingController(),
                        sendFriendshipRequestFunction: (() {  
                      })))),)
            ],
          ),
        ),
      ),
    );
  }
}
