import 'package:flutter/material.dart';

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MyPersistentHeaderDelegate({
    this.minExtent,
    this.maxExtent,
    this.rebuild,
    this.builder
  });

  final double minExtent;
  final double maxExtent;
  final Function rebuild;
  final Function builder;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return rebuild(oldDelegate);
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(context, shrinkOffset, overlapsContent);
  }
}
