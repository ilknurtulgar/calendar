import 'package:calendar/product/component/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {
  final CustomDrawer? isDrawer;
  final AppBar? isAppbar;
  final Widget body;
  const BaseView({super.key, this.isDrawer, required this.body, this.isAppbar});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isAppbar,
      body: widget.body,
      drawer: widget.isDrawer,
    );
  }
}