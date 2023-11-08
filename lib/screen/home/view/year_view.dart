import 'package:calendar/core/base/util/color.dart';
import 'package:calendar/screen/home/view/widgets/slide_switcher.dart';
import 'package:calendar/screen/home/view/widgets/year_switcher.dart';
import 'package:calendar/screen/home/viewmodel/date_switch_view_model.dart';
import 'package:calendar/screen/home/viewmodel/year_switcher_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class YearView extends StatelessWidget {
  YearView({super.key});

  final YearSwitchViewModel viewModel = YearSwitchViewModel();

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
        title: SlideSwitcher(switchIndex: SwitchIndex.week,),
        backgroundColor: ColorUtility().hover,
        elevation: 2,
        toolbarHeight: 75,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YearSwitcher(),
            Observer(builder: (_) {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemCount: getDaysInMonth(
                        viewModel.selectedYear, viewModel.selectedMonth)
                    .length,
                itemBuilder: (context, index) {
                  int day = getDaysInMonth(
                      viewModel.selectedYear, viewModel.selectedMonth)[index];
                  return Text(day.toString());
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  List<int> getDaysInMonth(int year, int month) {
    int daysInMonth = DateTime(year, month + 1, 0).day;
    return List<int>.generate(daysInMonth, (index) => index + 1);
  }
}
