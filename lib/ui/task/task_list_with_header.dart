import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'package:thingstodo/theme/colors.dart';
import 'package:thingstodo/data/model/models.dart';

import 'task_item.dart';

class TaskListWithHeader extends StatelessWidget {
  final List<TaskModel> tasks;
  final String title;

  TaskListWithHeader(this.tasks, this.title);

  Widget build(BuildContext context) {
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
            title,
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
