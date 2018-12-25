import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/ui/widget/calendar/inline_calendar.dart';

import '../task_vm.dart';

class MonthlyTaskView extends StatefulWidget {
  @override
  MonthlyTaskViewState createState() => MonthlyTaskViewState();
}

class MonthlyTaskViewState extends State<MonthlyTaskView> {
  Widget connector({ builder }) {
    return StoreConnector<AppState, TaskVM>(
      converter: TaskVM.fromStore,
      builder: builder
    );
  }

  Widget build(BuildContext context) {
    return connector(
      builder: (BuildContext context, TaskVM vm) {

        return CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              child: Container(
                constraints: BoxConstraints.expand(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Icon(
                        FontAwesomeIcons.userAstronaut,
                        color: Colors.grey.shade600,
                        size: 100,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Our developers are still working on it',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey.shade700,
                        ),
                      ),
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
