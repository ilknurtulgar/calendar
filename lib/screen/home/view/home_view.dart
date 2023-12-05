/*

© 2023 B1 Digital
© 2023 Skylab MobiLab

User         : alisinancobani
Project Name : calendar 
Name         : Ali Sinan COBANI
Date         : 6.12.2023 00:07
Notes        : 

*/

import 'package:calendar/core/base/view/base_view.dart';
import 'package:flutter/material.dart';

import '../view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: HomeViewModel(),
      onPageBuilder: ((context, model) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
          ),
        );
      }),
    );
  }
}
