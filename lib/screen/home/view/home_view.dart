/*

© 2023 Skylab MobiLab

User         : alisinancobani
Project Name : calendar 
Name         : Ali Sinan COBANI
Date         : 6.12.2023 00:07
Notes        : 

*/

import 'package:calendar/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../product/constants/util/color_constants.dart';
import '../view_model/home_view_model.dart';
import '../widgets/app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: HomeViewModel(),
      onPageBuilder: ((context, model) {
        return Scaffold(
          appBar: HomeAppBar(
            context: context,
            onSelected: (type) {},
            selectedType: HomeAppBarType.MONTH,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            shape: const CircleBorder(),
            backgroundColor: SurfaceColors.PRIMARY_COLOR,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          body: SfCalendar(
            view: HomeAppBarType.MONTH.calendarView!,
            todayHighlightColor: SurfaceColors.PRIMARY_COLOR,
            monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              showAgenda: true,
            ),
          ),
        );
      }),
    );
  }
}
