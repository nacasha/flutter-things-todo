import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:built_collection/built_collection.dart';

import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/ui/widget/calendar/inline_calendar.dart';

import '../task_vm.dart';

class MonthlyTaskView extends StatefulWidget {
  @override
  MonthlyTaskViewState createState() => MonthlyTaskViewState();
}

class MonthlyTaskViewState extends State<MonthlyTaskView> {
  Widget build(BuildContext context) {
    final connector = (builder) => StoreConnector<AppState, TaskVM>(
      converter: TaskVM.fromStore,
      rebuildOnChange: false,
      builder: builder
    );

    return connector(
      (BuildContext context, TaskVM vm) {

        return CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'You have clicke this many times'
                    ),
                    RaisedButton(
                      onPressed: () {
                        final taskId = DateTime.now().millisecondsSinceEpoch;

                        vm.createTask(
                          TaskModel((b) => b
                            ..taskId = '$taskId'
                            ..title = 'Jalan - jalan'
                            ..description = 'Sama kinol'
                            ..date = DateTime.now().toUtc()
                            ..category = 'Family'
                            ..status = TaskStatus.active
                            ..priority = TaskPriority.p1
                            ..important = false
                          )
                        );
                      },
                      child: Text('Click me'),
                    )
                  ],
                )
              ),
            )
          ],
        );
      }
    );
  }
}
