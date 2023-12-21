import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';
import '../../../product/component/checkbox/search.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onPageBuilder: (context, model) {
        return Scaffold(
          body: Column(
            children: [
              CustomSearch(
                  onArama: model.aramaYap, result: model.completeResult)
            ],
          ),
        );
      },
    );
  }
}
