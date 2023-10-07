import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {
                    print("heres");
                  },
                  icon: const Icon(Icons.arrow_back)),
              Expanded(
                child: Column(
                  children: <Widget>[
                    CustomTabBar(tabController: tabController),
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
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabController,
  });

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: 290,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xfffd9d9d9)),
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: TabBar(
        controller: tabController,
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        labelPadding: const EdgeInsets.symmetric(horizontal: 10),
        tabAlignment: TabAlignment.center,
        unselectedLabelColor: const Color(0xfff084c61),
        indicatorColor: Colors.transparent,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffff97173)),
        labelColor: const Color(0xfff084c61),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const <Widget>[
          Tab(
            text: 'HAFTA',
          ),
          Tab(text: 'AY'),
          Tab(text: 'GÜN'),
          Tab(text: 'YIL'),
          Tab(text: 'ETKİNLİK'),
        ],
      ),
    );
  }
}

List<Widget> get newMethod {
  return <Widget>[
    const Center(child: Text('Sekme 1İçeriği')),
    const Center(child: Text('Sekme 2 İçeriği')),
    const Center(child: Text('Sekme 3 İçeriği')),
    const Center(child: Text('Sekme 4 İçeriği')),
    const Center(child: Text('Sekme 5 İçeriği')),
  ];
}
