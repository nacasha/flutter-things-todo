import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'package:thingstodo/theme/colors.dart';
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
  Widget build(BuildContext context) {
    final connector = (builder) => StoreConnector<AppState, TaskVM>(
      converter: TaskVM.fromStore,
      builder: builder
    );

    return connector(
      (BuildContext context, TaskVM vm) {
        final tasks = vm.taskActiveList;

        return CustomScrollView(
          slivers: <Widget>[
            buildInlineCalendar(),
            buildTaskList(tasks, 'Today'),
            buildTaskList(tasks, '28 December')
          ],
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
