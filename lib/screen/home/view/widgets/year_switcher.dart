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
        return Row(
          children: [
            Text(
              viewModel.selectedYear.toString(),
              style: const TextStyle(fontSize: 20),
            ),
            IconButton(
              onPressed: () => viewModel.increaseYear(),
              icon: const Icon(Icons.arrow_right),
            ),
          ],
        );
      }),
    );
  }
}