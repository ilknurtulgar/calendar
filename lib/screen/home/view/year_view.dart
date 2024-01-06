import 'package:calendar/core/base/util/color.dart';
import 'package:calendar/screen/home/view/widgets/slide_switcher.dart';
import 'package:calendar/screen/home/view/widgets/year_switcher.dart';
import 'package:calendar/screen/home/viewmodel/date_switch_view_model.dart';
import 'package:flutter/material.dart';

import 'a.dart' as a;

class YearView extends StatelessWidget {
  const YearView({super.key});

  @override
  Widget build(BuildContext context) {
    // Make this variable observable
    var year = 2005;
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
        title: SlideSwitcher(
          switchIndex: SwitchIndex.year,
        ),
        backgroundColor: ColorUtility().hover,
        elevation: 2,
        toolbarHeight: 75,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YearSwitcher(),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.33,
                  height: MediaQuery.sizeOf(context).height * 0.17,
                  child: a.CalendarDatePicker(
                    initialDate: DateTime(2023, 1),
                    firstDate: DateTime(1900),
                    initialCalendarMode: DatePickerMode.day,
                    lastDate: DateTime(2400),
                    onDateChanged: (value) {
                      print(value);
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.33,
                  height: MediaQuery.sizeOf(context).height * 0.17,
                  child: a.CalendarDatePicker(
                    initialDate: DateTime(2023, 2),
                    firstDate: DateTime(1900),
                    initialCalendarMode: DatePickerMode.day,
                    lastDate: DateTime(2400),
                    onDateChanged: (value) {
                      print(value);
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.33,
                  height: MediaQuery.sizeOf(context).height * 0.17,
                  child: a.CalendarDatePicker(
                    initialDate: DateTime(2023, 3),
                    firstDate: DateTime(1900),
                    initialCalendarMode: DatePickerMode.day,
                    lastDate: DateTime(2400),
                    onDateChanged: (value) {
                      print(value);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
