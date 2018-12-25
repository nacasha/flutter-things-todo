import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:thingstodo/redux/app/app_state.dart';

import 'task_vm.dart';

class TaskSummaryCard extends StatelessWidget {
  Widget connector({ builder }) {
    return StoreConnector<AppState, TaskVM>(
      converter: TaskVM.fromStore,
      builder: builder
    );
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
      ),
      child: Card(
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildGreetingsText(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'TODAY \n',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        height: 1.6
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: DateFormat('dd MMM, yyyy').format(DateTime.now()),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ],
                    ),
                  ),
                  buildTodayStatus(context)
                ],
              )
            ],
          ),
        )
      ),
    );
  }

  buildGreetingsText(context) {
    String greetings;

    String time = DateFormat('HH').format(DateTime.now());
    int intTime = int.parse(time);

    if (intTime > 20) {
      greetings = 'Good Night';
    } else if (intTime > 17) {
      greetings = 'Good Evening';
    } else if (intTime > 14) {
      greetings = 'Good Afternoon';
    } else if (intTime > 12) {
      greetings = 'Good Noon';
    } else {
      greetings = 'Good Morning';
    }

    return RichText(
      text: TextSpan(
        text: '$greetings ',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: '',
            style: TextStyle(fontWeight: FontWeight.bold)
          ),
        ],
      ),
    );
  }

  buildTodayStatus(context) {
    return connector(
      builder: (BuildContext context, TaskVM vm) {
        final int totalDailyTask = vm.totalDailyTask;
        final int totalDailyTaskDone = vm.totalDailyTaskDone;

        return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Completed \n',
            style: TextStyle(
              fontSize: 15,
              color: Colors.green
            ),
            children: <TextSpan>[
              TextSpan(
                text: '$totalDailyTaskDone/',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold
                )
              ),
              TextSpan(
                text: '$totalDailyTask',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold
                )
              ),
            ],
          ),
        );
      }
    );
  }
}
