import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/ui/widget/inline_calendar.dart';

import '../task_item.dart';
import '../task_vm.dart';

class WeeklyTaskView extends StatefulWidget {
  @override
  WeeklyTaskViewState createState() => WeeklyTaskViewState();
}

class WeeklyTaskViewState extends State<WeeklyTaskView> {
  Widget build(BuildContext context) {
    final connector = (builder) => StoreConnector<AppState, TaskVM>(
      converter: TaskVM.fromStore,
      builder: builder
    );

    final overlap = NestedScrollView.sliverOverlapAbsorberHandleFor(context);

    return connector(
      (BuildContext context, TaskVM vm) {
        final tasks = vm.taskActiveList;

        return Container(
          margin: EdgeInsets.only(top: overlap.scrollExtent),
          child: CustomScrollView(
            slivers: <Widget>[
              buildInlineCalendar(),
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
          ),
        );
      }
    );
  }

  Widget buildInlineCalendar() {
    return SliverPersistentHeader(
      delegate: _InlineCalendarPersistHeader(),
      pinned: true,
      floating: true,
    );
  }
}

class _InlineCalendarPersistHeader extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 70;

  @override
  double get maxExtent => 70;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return InlineCalendar();
  }
}
