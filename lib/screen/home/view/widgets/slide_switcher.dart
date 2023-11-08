import 'package:calendar/core/base/base_state/base_state.dart';
import 'package:calendar/core/base/util/color.dart';
import 'package:calendar/screen/home/view/day_view.dart';
import 'package:calendar/screen/home/view/event_view.dart';
import 'package:calendar/screen/home/view/month_view.dart';
import 'package:calendar/screen/home/view/week_view.dart';
import 'package:calendar/screen/home/view/widgets/switcher_item.dart';
import 'package:calendar/screen/home/view/year_view.dart';
import 'package:calendar/screen/home/viewmodel/date_switch_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SlideSwitcher extends StatelessWidget {
  SlideSwitcher({super.key, this.switchIndex = SwitchIndex.week});
  late final SwitchIndex switchIndex;

  final DateSwitchViewModel viewModel = DateSwitchViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.changeSwitchIndex(switchIndex);
    return Container(
      width: width(context) * 0.77,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorUtility().border,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Observer(builder: (_) {
          return Row(
            children: [
              SwitcherItem(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  switchTransition(() => const WeekView()),
                ),
                isSwitched: viewModel.switchIndex == SwitchIndex.week,
                text: 'Hafta',
              ),
              SwitcherItem(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  switchTransition(() => const MonthView()),
                ),
                isSwitched: viewModel.switchIndex == SwitchIndex.month,
                text: 'Ay',
              ),
              SwitcherItem(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  switchTransition(() => const DayView()),
                ),
                isSwitched: viewModel.switchIndex == SwitchIndex.day,
                text: 'Gün',
              ),
              SwitcherItem(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  switchTransition(() => YearView()),
                ),
                isSwitched: viewModel.switchIndex == SwitchIndex.year,
                text: 'Yıl',
              ),
              SwitcherItem(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  switchTransition(() => const EventView()),
                ),
                isSwitched: viewModel.switchIndex == SwitchIndex.event,
                text: 'Etkinlik',
              ),
            ],
          );
        }),
      ),
    );
  }

  PageRouteBuilder<dynamic> switchTransition(Widget Function() page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page(),
      transitionDuration: const Duration(seconds: 0),
      transitionsBuilder: (_, animation, __, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}