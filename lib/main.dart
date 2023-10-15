import 'package:calendar/product/component/buttons/custom_filled_button.dart';
import 'package:calendar/product/component/buttons/custom_tabAppBar.dart';
import 'package:calendar/product/component/custom_bottom_sheet.dart';
import 'package:calendar/screen/login/view/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomTabAppBar(widget: dummyList),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFilledButton(
          backgroundColor: Colors.red,
          text: "selamen galben",
          textStyle: const TextStyle(),
          onTap: () {
            modalBottomSheet(context);
          },
        )
      ],
    );
  }
}
