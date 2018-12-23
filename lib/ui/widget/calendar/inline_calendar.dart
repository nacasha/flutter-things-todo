import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:date_utils/date_utils.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/theme/colors.dart';

import 'calendar_vm.dart';

class InlineCalendar extends StatefulWidget {
  final bool forceElevate;
  final Function onTap;
  final Function onLongTap;

  InlineCalendar({
    this.forceElevate = false,
    this.onTap,
    this.onLongTap,
  });

  @override
  InlineCalendarState createState() => InlineCalendarState();
}

class InlineCalendarState extends State<InlineCalendar> {
  int lastDirection;
  bool isPageChanged = false;
  ScrollPhysics scrollPhysics;
  PageController pageController;

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
      final ScrollPhysics isScrolled = notification.dragDetails == null
        ? NeverScrollableScrollPhysics()
        : AlwaysScrollableScrollPhysics();

      if (scrollPhysics.toString() != isScrolled.toString()) {
        this.setState(() {
          scrollPhysics = isScrolled;
        });
      }
    }

    if (notification is UserScrollNotification) {
      int direction = notification.direction.index;

      if (direction == 1 || direction == 2) {
        lastDirection = direction;
      }

      if (direction == 0) {
        if (isPageChanged) {
          final store = StoreProvider.of<AppState>(context);
          final vm = CalendarVM.fromStore(store);

          pageController.jumpToPage(1);

          if (lastDirection == 1) {
            vm.setPreviousWeek();
          } else {
            vm.setNextWeek();
          }
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

  Widget connector({ builder }) {
    return StoreConnector<AppState, CalendarVM>(
      converter: CalendarVM.fromStore,
      builder: builder
    );
  }

  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        boxShadow: widget.forceElevate ? [
          BoxShadow(
            offset: Offset(0, 0.7),
            blurRadius: 1,
            spreadRadius: 1,
            color: Colors.grey.shade400
          )
        ] : []
      ),
      child: Column(
        children: <Widget>[
          buildMonthYear(),
          Container(
            alignment: Alignment.center,
            height: 50,
            child: NotificationListener(
              onNotification: onNotification,
              child: buildInlineCalendar()
            )
          )
        ],
      )
    );
  }

  Widget buildInlineCalendar() {
    return connector(
      builder: (BuildContext context, CalendarVM vm) {
        DateTime currentWeek = vm.date;
        DateTime nextWeek = currentWeek.add(Duration(days: 7));
        DateTime prevWeek = currentWeek.add(Duration(days: -7));

        return PageView(
          physics: scrollPhysics,
          controller: pageController,
          onPageChanged: onPageChanged,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            buildDaysInRange(prevWeek),
            buildDaysInRange(currentWeek),
            buildDaysInRange(nextWeek),
          ]
        );
      }
    );
  }

  Widget buildMonthYear() {
    return connector(
      builder: (BuildContext context, CalendarVM vm) {
        String label = DateFormat('MMMM, yyyy').format(vm.date);

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
    );
  }

  Widget buildDayTile(DateTime date) {
    final store = StoreProvider.of<AppState>(context);
    final vm = CalendarVM.fromStore(store);

    String daylabel = DateFormat('EEE').format(date).toUpperCase();
    String dateLabel = DateFormat('d').format(date);

    bool selected = Utils.isSameDay(vm.selectedDate, date);

    final calendarText = TextSpan(
      children: [
        TextSpan(
          text: '$daylabel\n',
          style: TextStyle(
            fontSize: 12,
            color: selected ? kPrimaryColor : Colors.grey.shade200
          )
        ),
        TextSpan(
          text: dateLabel,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            height: 1.2,
            color: selected ? kPrimaryColor : Colors.grey.shade200
          )
        )
      ]
    );

    return Expanded(
      child: Container(
        color: selected ? Colors.white : kPrimaryColor,
        constraints: BoxConstraints.expand(),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // vm.updateSelectedDate(date);

              if (widget.onTap != null) {
                widget.onTap(date);
              }
            },
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: calendarText
              ),
            )
          )
        ),
      )
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
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: generatedDays,
      )
    );
  }
}
