import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:date_utils/date_utils.dart';

import 'package:thingstodo/theme/colors.dart';

class InlineCalendar extends StatefulWidget {

  @override
  InlineCalendarState createState() => InlineCalendarState();
}

class InlineCalendarState extends State<InlineCalendar> {
  int lastDirection;
  bool isPageChanged = false;
  ScrollPhysics scrollPhysics;
  PageController pageController;
  DateTime currentWeek = DateTime.now();

  @override
  initState() {
    super.initState();

    scrollPhysics = AlwaysScrollableScrollPhysics();
    pageController = PageController(
      initialPage: 1
    );
  }

  onPageChanged(index) {
    isPageChanged = false;
    if (index != 1) {
      isPageChanged = true;
    }
  }

  bool onNotification(ScrollNotification notification) {
    if(notification is ScrollUpdateNotification) {
      if (notification.dragDetails == null) {
        if (scrollPhysics is AlwaysScrollableScrollPhysics) {
          this.setState(() {
            scrollPhysics = NeverScrollableScrollPhysics();
          });
        }
      } else {
        if (scrollPhysics is NeverScrollableScrollPhysics) {
          this.setState(() {
            scrollPhysics = AlwaysScrollableScrollPhysics();
          });
        }
      }
    }

    if (notification is UserScrollNotification) {
      int direction = notification.direction.index;

      if (direction == 1 || direction == 2) {
        lastDirection = direction;
      }

      if (direction == 0) {
        if (isPageChanged) {
          pageController.jumpToPage(1);

          this.setState(() {
            if (lastDirection == 1) {
              currentWeek = currentWeek.subtract(Duration(days: 7));
            } else {
              currentWeek = currentWeek.add(Duration(days: 7));
            }
          });
        }

        if (scrollPhysics is NeverScrollableScrollPhysics) {
          this.setState(() {
            scrollPhysics = AlwaysScrollableScrollPhysics();
          });
        }
      }
    }

    return false;
  }

  Widget build(BuildContext context) {
    DateTime nextWeek = currentWeek.add(Duration(days: 7));
    DateTime prevWeek = currentWeek.subtract(Duration(days: 7));

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0.7),
            blurRadius: 1,
            spreadRadius: 1,
            color: Colors.grey.shade400
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          buildMonthYear(currentWeek),
          Container(
            alignment: Alignment.center,
            height: 44,
            child: NotificationListener(
              onNotification: onNotification,
              child: PageView(
                physics: scrollPhysics,
                controller: pageController,
                onPageChanged: onPageChanged,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  buildDaysInRange(prevWeek),
                  buildDaysInRange(currentWeek),
                  buildDaysInRange(nextWeek),
                ],
              ),
            )
          )
        ],
      )
    );
  }

  Widget buildMonthYear(date) {
    String label = DateFormat('MMMM, yyyy').format(date);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget buildDayTile(DateTime date) {
    String daylabel = DateFormat('EEE').format(date).toUpperCase();
    String dateLabel = DateFormat('d').format(date);

    return Container(
      color: kPrimaryColor,
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: '$daylabel\n',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade200
              )
            ),
            TextSpan(
              text: dateLabel,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                height: 1.2
              )
            )
          ]
        ),
      ),
    );
  }

  Widget buildDaysInRange(date) {
    List<Widget> generatedDays = [];

    DateTime firstDayOfWeek = Utils.firstDayOfWeek(date);
    DateTime lastDayOfWeek = Utils.lastDayOfWeek(date);

    Iterable<DateTime> days = Utils.daysInRange(
      firstDayOfWeek,
      lastDayOfWeek
    );

    for (var day in days) {
      generatedDays.add(
        buildDayTile(day)
      );
    }

    return Container(
      color: kPrimaryColor,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GridView.extent(
        shrinkWrap: true,
        maxCrossAxisExtent: 50,
        padding: EdgeInsets.all(0),
        children: generatedDays
      )
    );
  }
}
