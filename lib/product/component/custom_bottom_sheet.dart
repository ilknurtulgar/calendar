// ignore_for_file: non_constant_identifier_names

import 'package:calendar/product/constants/util/color_constants.dart';
import 'package:calendar/product/constants/util/text_styles.dart';
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
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          minChildSize: 0.2,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return ColumnScroll(scrollController, context);
          },
        );
      });
}

Widget ColumnScroll(ScrollController scrollController, BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SingleChildScrollView(
        controller: scrollController,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    width: 80,
                    height: 6,
                    decoration: const BoxDecoration(
                        color: AssetColors.SECONDARY_COLOR,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                ),
                RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(text: "Günün Özeti", children: [
                      TextSpan(
                        text:
                            " ${DateTime.now().day.toString()}.${DateTime.now().month.toString()}.${DateTime.now().year.toString()}",
                        style: TextStyles.SMALL,
                      )
                    ])),
              ],
            ),
          ),
        ),
      ),
      /*Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          width: 80,
          height: 6,
          decoration: const BoxDecoration(
              color: AssetColors.SECONDARY_COLOR,
              borderRadius: BorderRadius.all(Radius.circular(50))),
        ),
      ),*/
      /*  const Padding(
        padding: EdgeInsets.only(top: 15),
        child: Text(
          "Günün Özeti",
          style: TextStyles.MEDIUM,
        ),
      ),*/
      /* Text(
        " ${DateTime.now().day.toString()}.${DateTime.now().month.toString()}.${DateTime.now().year.toString()}",
        style: TextStyles.SMALL,
      ),*/
      Expanded(
        child: Listview_scroll(scrollController),
      )
    ],
  );
}

ListView Listview_scroll(ScrollController scrollController) {
  return ListView.builder(
    controller: scrollController,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(15),
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
