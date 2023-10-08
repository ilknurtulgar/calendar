import 'package:calendar/core/base/base_state/base_state.dart';
import 'package:calendar/core/base/view/base_view.dart';
import 'package:calendar/product/component/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends BaseStateless {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        body: const Column(),
        isAppbar: AppBar(),
        isDrawer: const CustomDrawer(
          name: "Gizem",
          img: "https://www.denofgeek.com/wp-content/uploads/2023/03/star-wars-the-mandalorian-season-3-grogu.jpg",
          filter: ["Etkinlikler", "Muhterem Takvimi", "Mobilab", "Muhterem Takvimi", "Mobilab", "Muhterem Takvimi", "Mobilab"],
        ));
  }
}
