import 'package:calendar/screen/home/view/widgets/year_item.dart';
import 'package:calendar/screen/home/viewmodel/year_switcher_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class YearSwitcher extends StatelessWidget {
  
  YearSwitcher({super.key});

  final YearSwitchViewModel viewModel = YearSwitchViewModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Observer(builder: (_) {
        return SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buttons,
          ),
        );
      }),
    );
  }
}

List<YearItem> buttons = List.generate(years.length, (index) {
  return YearItem(
    onPressed: () {},
    text: years[index].toString(),
  );
});
