import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:calendar/product/constants/util/icon_util.dart';
import 'package:calendar/product/constants/util/padding_constants.dart';
import 'package:calendar/product/constants/util/text_util.dart';
import 'package:flutter/material.dart';

import '../../constants/util/border_radius_constants.dart';

class CustomTabAppBar extends StatelessWidget {
  const CustomTabAppBar({super.key, this.tabController, required this.widget});
  final TabController? tabController;
  final List<Widget> widget;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        body: Padding(
          padding: AppPaddings.MEDIUM_V,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconUtil.arrowBackButton(() {}),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      //  width: 290,
                      height: 50,
                      decoration: tabBoxDecoration(),
                      child: CustomTabBar(tabController: tabController),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: widget,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration tabBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 1, color: SurfaceColors.TAB_BORDER_COLOR),
      borderRadius: AppBorderRadius.GENERAL,
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabController,
  });

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      overlayColor: const MaterialStatePropertyAll(SurfaceColors.TRANSPARENT),
      labelPadding: AppPaddings.SMALL_H,
      tabAlignment: TabAlignment.center,
      unselectedLabelColor: SurfaceColors.SECONDARY_COLOR,
      indicatorColor: SurfaceColors.TRANSPARENT,
      indicator: BoxDecoration(
          borderRadius: AppBorderRadius.GENERAL,
          color: SurfaceColors.PRIMARY_COLOR),
      labelColor: SurfaceColors.SECONDARY_COLOR,
      tabs: tabCategoryList,
    );
  }

  List<Widget> get tabCategoryList {
    return const <Widget>[
      Tab(text: TabbBarTextUtil.week),
      Tab(text: TabbBarTextUtil.moon),
      Tab(text: TabbBarTextUtil.day),
      Tab(text: TabbBarTextUtil.year),
      Tab(text: TabbBarTextUtil.activities),
    ];
  }
}

List<Widget> get dummyList {
  return <Widget>[
    const Center(child: Text('Sekme 1İçeriği')),
    const Center(child: Text('Sekme 2 İçeriği')),
    const Center(child: Text('Sekme 3 İçeriği')),
    const Center(child: Text('Sekme 4 İçeriği')),
    const Center(child: Text('Sekme 5 İçeriği')),
  ];
}
