import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'package:thingstodo/theme/colors.dart';
import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/ui/widget/app_bar/my_app_bar.dart';
import 'package:thingstodo/ui/widget/my_drawer.dart';

import '../task_list_with_header.dart';
import '../task_item.dart';
import '../task_vm.dart';

class TaskFilteredPage extends StatefulWidget {
  static final String route = '/task-filtered';

  final String filterType;

  TaskFilteredPage({
    this.filterType
  });

  @override
  TaskFilteredPageState createState() => TaskFilteredPageState();
}

class TaskFilteredPageState extends State<TaskFilteredPage> with SingleTickerProviderStateMixin {
  double isScrolled = 0;
  TabController tabController;

  Widget connector({ builder }) {
    return StoreConnector<AppState, TaskVM>(
      converter: TaskVM.fromStore,
      builder: builder
    );
  }

  Widget build(BuildContext context) {
    // build
    return Scaffold(
      drawer: Drawer(
        child: MyDrawer(),
      ),
      appBar: buildAppBar(context),
      body: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverFillRemaining(
                child: buildPageContent()
              )
            ],
          );
        },
      )
    );
  }

  Widget buildPageContent() {
    return connector(
      builder: (BuildContext context, TaskVM vm) {
        final List<Widget> slivers = [];
        Map<String, List<TaskModel>> groupOfTasks;

        switch(widget.filterType) {
          case 'done':
            groupOfTasks = vm.doneTask;
            break;
          case 'later':
            groupOfTasks = vm.laterTask;
            break;
          case 'important':
            groupOfTasks = vm.importantTask;
            break;
        }

        groupOfTasks.forEach((String index, List group) {
          final tasks = groupOfTasks[index];

          slivers.add(
            TaskListWithHeader(tasks, index)
          );
        });

        return CustomScrollView(
          slivers: slivers
        );
      }
    );
  }

  Widget buildAppBar(context) {
    String title;
    switch(widget.filterType) {
      case 'done': title = 'Done Task'; break;
      case 'later': title = 'Later Task'; break;
      case 'important': title = 'Important Task'; break;
    }

    return MyAppBar(
      context: context,
      title: Text(title),
      elevation: isScrolled,
      titleSpacing: 0,
    );
  }
}
