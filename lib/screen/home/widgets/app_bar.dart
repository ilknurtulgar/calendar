// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../product/constants/util/color_constants.dart';
import '../../../product/constants/util/padding_constants.dart';

enum HomeAppBarType {
  DAY('Day', CalendarView.day),
  WEEK('Week', CalendarView.week),
  MONTH('Month', CalendarView.month),
  YEAR('Year', null),
  EVENT('Event', CalendarView.schedule);

  final String name;
  final CalendarView? calendarView;

  const HomeAppBarType(
    this.name,
    this.calendarView,
  );
}

class HomeAppBar extends AppBar {
  final BuildContext context;
  final Function(HomeAppBarType) onSelected;
  final HomeAppBarType selectedType;

  HomeAppBar({
    super.key,
    required this.context,
    required this.onSelected,
    this.selectedType = HomeAppBarType.DAY,
  }) : super(
          centerTitle: true,
          elevation: 1,
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
        );

  @override
  Widget? get flexibleSpace => SafeArea(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            const Spacer(),
            Container(
              padding: AppPaddings.SMALL_H,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: SurfaceColors.TAB_BORDER_COLOR,
                ),
              ),
              child: Row(
                children: [
                  ...HomeAppBarType.values
                      .map(
                        (e) => TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: e == selectedType
                                ? SurfaceColors.PRIMARY_COLOR
                                : null,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            onSelected(e);
                          },
                          child: Text(
                            e.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      );
}
