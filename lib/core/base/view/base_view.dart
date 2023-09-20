import 'package:flutter/material.dart';
import '../store/base_store.dart';

class BaseView<T extends BaseStore> extends StatefulWidget {
  const BaseView({
    super.key,
    required this.viewModel,
    required this.onPageBuilder,
  });

  final BaseStore viewModel;
  final Widget Function(BuildContext context, T model) onPageBuilder;

  @override
  State<BaseView<T>> createState() => _BaseView<T>();
}

class _BaseView<T extends BaseStore> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    model = widget.viewModel as T;
    model.onInit();
    super.initState();
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}
