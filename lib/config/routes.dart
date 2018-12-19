import 'package:flutter/material.dart';

import 'package:thingstodo/ui/home/home_page.dart';
import 'package:thingstodo/ui/task/task_form_page.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.route: (context) => HomePage(),
  TaskFormPage.route: (context) => TaskFormPage(
    previousContext: context,
  )
};
