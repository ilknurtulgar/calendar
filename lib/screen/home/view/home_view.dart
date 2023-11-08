import 'package:calendar/core/base/util/color.dart';
import 'package:calendar/screen/home/view/widgets/slide_switcher.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility().hover,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: SlideSwitcher(),
        backgroundColor: ColorUtility().hover,
        elevation: 2,
        toolbarHeight: 75,
      ),
      body: const Center(
        child: Text('HomeView is working'),
      ),
    );
  }
}
