import 'package:calendar/core/base/base_state/base_state.dart';
import 'package:calendar/core/base/view/base_view.dart';
import 'package:calendar/product/component/appbars/secondary_app_bar.dart';
import 'package:calendar/product/component/container/date_time_container.dart';
import 'package:calendar/product/component/custom_divider.dart';
import 'package:calendar/product/component/text_form_field/widget/custom_text_input_field.dart';
import 'package:calendar/product/constants/util/padding_constants.dart';
import 'package:calendar/screen/create_event/viewmodel/create_event_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../../product/constants/util/color_constants.dart';

class CreateEventView extends StatefulWidget {
  const CreateEventView({super.key});

  @override
  State<CreateEventView> createState() => _CreateEventViewState();
}

bool selectColor = false;

class _CreateEventViewState extends State<CreateEventView> {
  @override
  Widget build(BuildContext context) {
    Color selectedColor = colorScheme.secondary;
    TextEditingController controllerTitle = TextEditingController();
    return BaseView<CreateEventViewmodel>(
      viewModel: CreateEventViewmodel(),
      onPageBuilder: ((context, model){
        return Scaffold(
          appBar: SecondaryAppBar(
            title: 'Yeni Etkinlik',
            onPressed: () {},
          ),
          body: Stack(
            children: [
              Padding(
                padding: AppPaddings.GENERAL,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildTitle("Başlık"),
                        selectColorCircle(() {
                          setState(() {
                            selectColor = !selectColor;
                          });
                        }, selectedColor)
                      ],
                    ),
                    CustomTextInputField(textController: controllerTitle),
                    Padding(
                      padding: AppPaddings.SMALL_V,
                      child: customDivider(),
                    ),
                    buildTitle("Detay"),
                    CustomTextInputField(
                      textController: controllerTitle,
                      heightValue: 138,
                    ),
                    Padding(
                      padding: AppPaddings.SMALL_V,
                      child: customDivider(),
                    ),
                    buildTitle("Takvim"),
                  ],
                ),
              ),
              selectColor == true ? selectColorMethod(context) : const SizedBox(),
            ],
          ),
        );
      })
    );
  }

  Align selectColorMethod(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: SurfaceColors.SECONDARY_COLOR)),
          height: height(context) / 12,
          width: width(context) / 3,
          padding: const EdgeInsets.all(5),
          child: Wrap(
            alignment: WrapAlignment.start,
            runSpacing: 3,
            children: [
              selectColorCircle(() {}, colorScheme.onBackground),
              selectColorCircle(() {}, colorScheme.secondary),
              selectColorCircle(() {}, colorScheme.primary),
              selectColorCircle(() {}, colorScheme.primary),
              selectColorCircle(() {}, colorScheme.primary),
            ],
          ),
        ),
      ),
    );
  }

  Padding selectColorCircle(Function() onTap, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(100)),
          height: 22,
          width: 22,
        ),
      ),
    );
  }

  Padding buildTitle(String text) => Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      );
}
