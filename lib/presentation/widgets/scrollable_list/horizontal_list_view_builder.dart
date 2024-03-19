import 'package:flutter/material.dart';

class HorizontalListViewBuilder extends StatelessWidget {
  const HorizontalListViewBuilder({
    super.key,
    required this.itemExtent,
    required this.builder,
    required this.itemCount,
  });

  final double itemExtent;
  final Widget? Function(BuildContext, int) builder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: builder,
      itemCount: itemCount,
      itemExtent: itemExtent,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
