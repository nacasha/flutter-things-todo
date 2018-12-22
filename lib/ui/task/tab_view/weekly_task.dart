import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:date_utils/date_utils.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'package:thingstodo/theme/colors.dart';
import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/ui/widget/calendar/inline_calendar.dart';
import 'package:thingstodo/ui/widget/builder/my_persistent_header_delegate.dart';

import '../task_item.dart';
import '../task_vm.dart';

class WeeklyTaskView extends StatefulWidget {
  @override
  WeeklyTaskViewState createState() => WeeklyTaskViewState();
}

class WeeklyTaskViewState extends State<WeeklyTaskView> {
  Widget connector({ builder }) {
    return StoreConnector<AppState, TaskVM>(
      converter: TaskVM.fromStore,
      builder: builder
    );
  }

  Widget build(BuildContext context) {
    return connector(
      builder: (BuildContext context, TaskVM vm) {
        final Map<String, List<TaskModel>> groupOfTasks = vm.weeklyTask;
        final List<Widget> slivers = [];

        slivers.add(buildInlineCalendar());

        groupOfTasks.forEach((String index, List group) {
          final tasks = groupOfTasks[index];

          slivers.add(buildTaskList(tasks, index));
        });

        return CustomScrollView(
          slivers: slivers
        );
      }
    );
  }

  Widget buildInlineCalendar() {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: MyPersistentHeaderDelegate(
        minExtent: 76,
        maxExtent: 76,
        rebuild: (oldDelegate) => false,
        builder: (context, offset, overlaps) {
          return InlineCalendar(
            forceElevate: true,
          );
        }
      ),
    );
  }

  Widget buildTaskList(tasks, text) {
    return SliverStickyHeaderBuilder(
      builder: (context, state) {
        return Container(
          height: 35,
          decoration: BoxDecoration(
            color: kBackgroundColor,
            border: Border(bottom: BorderSide(
              color: Colors.grey.shade300
            ))
          ),
          alignment: Alignment.center,
          child: new Text(
            text,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
          ),
        );
      },
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final task = tasks[index];

            return TaskItem(task);
          },
          childCount: tasks.length
        )
      )
    );
  }
}
