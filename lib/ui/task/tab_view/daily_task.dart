import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:built_collection/built_collection.dart';

import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';

import '../task_item.dart';
import '../task_vm.dart';

class DailyTaskView extends StatefulWidget {
  @override
  DailyTaskViewState createState() => DailyTaskViewState();
}

class DailyTaskViewState extends State<DailyTaskView> {
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
