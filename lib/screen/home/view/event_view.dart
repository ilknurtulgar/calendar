import 'package:calendar/core/base/util/color.dart';
import 'package:calendar/screen/home/view/widgets/slide_switcher.dart';
import 'package:calendar/screen/home/viewmodel/date_switch_view_model.dart';
import 'package:flutter/material.dart';

class EventView extends StatelessWidget {
  const EventView({super.key});

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
        title: SlideSwitcher(switchIndex: SwitchIndex.event,),
        backgroundColor: ColorUtility().hover,
        elevation: 2,
        toolbarHeight: 75,
      ),
      body: const Center(
        child: Text('Event screen is working'),
      ),
    );
  }
}
