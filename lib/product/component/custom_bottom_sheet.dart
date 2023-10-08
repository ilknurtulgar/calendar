import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:calendar/product/constants/util/padding_constants.dart';
import 'package:calendar/product/constants/util/text_styles.dart';
import 'package:calendar/product/constants/util/text_util.dart';
import 'package:flutter/material.dart';

void modalBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: SurfaceColors.SECONDARY_COLOR,
      barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(50),
      )),
      context: context,
      builder: (context) {
        return const CustomScrollableBottomSheet();
      });
}

class CustomScrollableBottomSheet extends StatelessWidget {
  const CustomScrollableBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.5,
      minChildSize: 0.2,
      maxChildSize: 0.90,
      builder: (context, scrollController) {
        return Padding(
          padding: AppPaddings.GENERAL,
          child: Column(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Padding(
                      padding: AppPaddings.MEDIUM_V,
                      child: lineContainer(),
                    ),
                    Padding(
                      padding: AppPaddings.SMALL_V,
                      child: firstText(),
                    ),
                    secondText(),
                  ],
                ),
              ),
              Expanded(
                child: listviewScroll(),
              ),
            ],
          ),
        );
      },
    );
  }
}

Text secondText() {
  return Text(
    " ${DateTime.now().day.toString()}.${DateTime.now().month.toString()}.${DateTime.now().year.toString()}",
    style: TextStyles.SMALL,
  );
}

Text firstText() {
  return const Text(
    BottomSheetTextUtil.daySummary,
    style: TextStyles.MEDIUM,
  );
}

Container lineContainer() {
  return Container(
    width: 80,
    height: 6,
    decoration: const BoxDecoration(
        color: AssetColors.SECONDARY_COLOR,
        borderRadius: BorderRadius.all(Radius.circular(50))),
  );
}

ListView listviewScroll() {
  return ListView.builder(
    itemBuilder: (context, index) {
      return Padding(
        padding: AppPaddings.GENERAL,
        child: Text(
          dummyDateList[index],
          style: TextStyles.SMALL,
        ),
      );
    },
    itemCount: dummyDateList.length,
  );
}

List<String> dummyDateList = [
  "Mobilab Toplantısı",
  "Skysis Toplantısı",
  "Mobilab Toplantısı",
  "Skysis Toplantısı",
  "Mobilab Toplantısı",
  "Skysis Toplantısı",
  "Mobilab Toplantısı",
  "Skysis Toplantısı",
  "Mobilab Toplantısı",
  "Skysis Toplantısı",
  "Mobilab Toplantısı",
  "Skysis Toplantısı",
  //
  "Mobilab Toplantısı",
  "Skysis Toplantısı",
  "Mobilab Toplantısı",
  "Skysis Toplantısı",
  "Mobilab Toplantısı",
  "Skysis Toplantısı",
  "Mobilab Toplantısı",
  "Skysis Toplantısı",
  "Mobilab Toplantısı",
  "Skysis Toplantısı",
  "Mobilab Toplantısı",
  "Skysis Toplantısı",
];
