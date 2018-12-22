import 'package:flutter/material.dart';

import 'package:thingstodo/theme/colors.dart';
import 'package:thingstodo/ui/task/tab_view/daily_task.dart';
import 'package:thingstodo/ui/task/tab_view/monthly_task.dart';
import 'package:thingstodo/ui/task/tab_view/weekly_task.dart';
import 'package:thingstodo/ui/widget/search_bar.dart';
import 'package:thingstodo/ui/widget/app_bar/my_sliver_app_bar.dart';
import 'package:thingstodo/ui/widget/show_snack_bar.dart';
import 'package:thingstodo/ui/widget/my_drawer.dart';

class HomePage extends StatefulWidget {
  static final String route = '/';

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool isScrolled = false;
  TabController tabController;

  @override
  initState() {
    super.initState();

    isScrolled = false;
    tabController = new TabController(
      vsync: this,
      length: 3
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  bool onNotification(ScrollNotification notification) {
    if (notification.depth == 1) {
      if (tabController.index == 0) {
        final double pixels = notification.metrics.pixels;
        final bool elevated = pixels > 0 ? true : false;

        if (elevated != isScrolled) {
          setState(() {
            isScrolled = elevated;
          });
        }
      }
    } else {
      if (isScrolled != false) {
        setState(() {
          isScrolled = false;
        });
      }
    }

    return true;
  }

  Widget build(BuildContext context) {
    // TabBar View Builder
    final tabbarViewBuilder = (view) => SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return view;
        },
      ),
    );

    // build
    return Scaffold(
      drawer: Drawer(
        child: MyDrawer(),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              buildSliverAppBar(context),
              SliverFillRemaining(
                child: NotificationListener(
                  onNotification: onNotification,
                  child: TabBarView(
                    controller: tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      tabbarViewBuilder(DailyTaskView()),
                      tabbarViewBuilder(WeeklyTaskView()),
                      tabbarViewBuilder(MonthlyTaskView()),
                    ],
                  ),
                )
              )
            ],
          );
        },
      )
    );
  }

  Widget buildSliverAppBar(BuildContext context) {
     // TabBar
    final tabBar = PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Column(
        children: <Widget>[
          SearchBar(),
          TabBar(
            controller: tabController,
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            tabs: <Widget>[
              Tab(text: 'DAILY'),
              Tab(text: 'WEEKLY'),
              Tab(text: 'MONTHLY'),
            ],
          )
        ],
      ),
    );

    return MySliverAppBar(
      context: context,
      pinned: true,
      bottom: tabBar,
      titleSpacing: 0,
      forceElevated: isScrolled,
    );
  }
}
