import 'package:flutter/material.dart';

import 'package:thingstodo/ui/task/tab_view/daily_task.dart';
import 'package:thingstodo/ui/task/tab_view/monthly_task.dart';
import 'package:thingstodo/ui/task/tab_view/weekly_task.dart';
import 'package:thingstodo/ui/widget/search_bar.dart';
import 'package:thingstodo/ui/widget/app_bar/my_sliver_app_bar.dart';
import 'package:thingstodo/ui/widget/app_bar/my_app_bar.dart';

class HomePage extends StatefulWidget {
  static final String route = '/';

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  GlobalKey homeScaffold = GlobalKey<HomePageState>();

  @override
  Widget build(BuildContext context) {
    // SearchBar
    final searchBar = FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Padding(
        padding: EdgeInsets.only(top: 80),
        child: SearchBar(),
      )
    );

    // TabBar
    final tabBar = TabBar(
      indicatorColor: Colors.white,
      indicatorWeight: 3,
      tabs: <Widget>[
        Tab(text: 'DAILY'),
        Tab(text: 'WEEKLY'),
        Tab(text: 'MONTHLY'),
      ],
    );

    // Absorber handler
    final handle = (context) {
      return NestedScrollView.sliverOverlapAbsorberHandleFor(context);
    };

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: homeScaffold,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: handle(context),
                child: MySliverAppBar(
                  context: context,
                  expandedHeight: 165,
                  pinned: true,
                  snap: true,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: searchBar,
                  bottom: tabBar
                )
              ),
            ];
          },
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              tabbarViewBuilder(DailyTaskView()),
              tabbarViewBuilder(WeeklyTaskView()),
              tabbarViewBuilder(MonthlyTaskView()),
            ],
          ),
        ),
      ),
    );
  }
}
