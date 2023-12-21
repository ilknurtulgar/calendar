import 'package:flutter/material.dart';

class CustomWrap extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final Axis direction;
  final EdgeInsets padding;
  const CustomWrap(
      {super.key,
      required this.children,
      this.spacing = 15,
      this.direction = Axis.vertical,
      this.padding = const EdgeInsets.symmetric(horizontal: 20),
    });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      itemCount: children.length,
      scrollDirection: direction,
      shrinkWrap: true,
      itemBuilder: ((context, index) => children[index]),
      separatorBuilder: ((context, index) => SizedBox(
            height: direction == Axis.vertical ? spacing : 0,
            width: direction == Axis.horizontal ? spacing : 0,
          )),
    );
  }
}
