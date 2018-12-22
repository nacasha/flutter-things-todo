import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:built_collection/built_collection.dart';

import 'package:thingstodo/theme/colors.dart';
import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/ui/widget/app_bar/my_sliver_app_bar.dart';

import '../task_vm.dart';
import '../task_item.dart';
import '../task_summary_card.dart';

class DailyTaskView extends StatefulWidget {
  @override
  DailyTaskViewState createState() => DailyTaskViewState();
}

class DailyTaskViewState extends State<DailyTaskView> {
  Widget connector({ builder }) {
    return StoreConnector<AppState, TaskVM>(
      converter: TaskVM.fromStore,
      builder: builder
    );
  }

  Widget build(BuildContext context) {
    return connector(
      builder: (BuildContext context, TaskVM vm) {
        final tasks = vm.dailyTask;

        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: kBackgroundColor,
              flexibleSpace: FlexibleSpaceBar(
                background: TaskSummaryCard(),
              ),
              expandedHeight: 130,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index == 0) return Container(
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(
                        color: Colors.grey.shade300
                      ))
                    )
                  );

                  final task = tasks[index - 1];

                  return TaskItem(task);
                },
                childCount: tasks.length + 1
              )
            )
          ],
        );
      }
    );
  }
}
