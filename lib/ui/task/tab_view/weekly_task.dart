import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:built_collection/built_collection.dart';

import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';

import '../task_item.dart';
import '../task_vm.dart';

class StickyHeader extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 20;

  @override
  double get maxExtent => 30;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent)
  {
    print(overlapsContent);
    print(shrinkOffset);

    return Container(
      alignment: Alignment.bottomLeft,
      color: Colors.red,
      child: Text("Headerr"),
    );
  }
  @override
  bool shouldRebuild(StickyHeader oldDelegate) {
    return true;
  }
}

class WeeklyTaskView extends StatefulWidget {
  @override
  WeeklyTaskViewState createState() => WeeklyTaskViewState();
}

class WeeklyTaskViewState extends State<WeeklyTaskView> {
  Widget build(BuildContext context) {
    final connector = (builder) => StoreConnector<AppState, TaskVM>(
      converter: TaskVM.fromStore,
      rebuildOnChange: false,
      builder: builder
    );

    return connector(
      (BuildContext context, TaskVM vm) {
        final tasks = vm.tasks;

        return CustomScrollView(
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)
            ),
            SliverPersistentHeader(
              delegate: StickyHeader(),
              pinned: true,
              floating: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final task = tasks[index];

                  return TaskItem(task);
                },
                childCount: tasks.length
              )
            )
          ],
        );
      }
    );
  }
}
