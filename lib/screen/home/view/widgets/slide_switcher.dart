import 'package:calendar/core/base/base_state/base_state.dart';
import 'package:calendar/core/base/util/color.dart';
import 'package:calendar/screen/home/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SlideSwitcher extends StatelessWidget {
  SlideSwitcher({super.key});

  final HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
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
                onPressed: () => viewModel.changeSwitchIndex(SwitchIndex.week),
                isSwitched: viewModel.switchIndex == SwitchIndex.week,
                text: 'Hafta',
              ),
              SwitcherItem(
                onPressed: () => viewModel.changeSwitchIndex(SwitchIndex.month),
                isSwitched: viewModel.switchIndex == SwitchIndex.month,
                text: 'Ay',
              ),
              SwitcherItem(
                onPressed: () => viewModel.changeSwitchIndex(SwitchIndex.day),
                isSwitched: viewModel.switchIndex == SwitchIndex.day,
                text: 'Gün',
              ),
              SwitcherItem(
                onPressed: () => viewModel.changeSwitchIndex(SwitchIndex.year),
                isSwitched: viewModel.switchIndex == SwitchIndex.year,
                text: 'Yıl',
              ),
              SwitcherItem(
                onPressed: () => viewModel.changeSwitchIndex(SwitchIndex.event),
                isSwitched: viewModel.switchIndex == SwitchIndex.event,
                text: 'Etkinlik',
              ),
            ],
          );
        }),
      ),
    );
  }
}

class SwitcherItem extends StatelessWidget {
  const SwitcherItem({
    super.key,
    this.isSwitched = false,
    required this.onPressed,
    required this.text,
  });

  final bool isSwitched;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            isSwitched ? ColorUtility().primary : ColorUtility().hover,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: SizedBox(
          height: 35,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: ColorUtility().dark,
                fontSize: 11,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
