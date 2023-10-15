import 'package:calendar/product/component/container/person_container.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PersonContainer(name: "Gizem Göksu", removePersonFunction: (() => print("heyoo"))),
            ],
          ),
        ),
      ),
    );
  }
}
