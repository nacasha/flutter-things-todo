/**
 * This file is not being used until Navigator able to to pass
 * parameters when using pushNamed()
 */
import 'package:flutter/material.dart';

import 'package:thingstodo/ui/home/home_page.dart';
import 'package:thingstodo/ui/task/pages/task_detail_page.dart';
import 'package:thingstodo/ui/task/pages/task_form_page.dart';
import 'package:thingstodo/ui/task/pages/task_filtered_page.dart';
import 'package:thingstodo/ui/category/category_page.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.route: (context) => HomePage(),
  TaskFormPage.route: (context) => TaskFormPage(),
  TaskFilteredPage.route: (context) => TaskFilteredPage(),
  CategoryPage.route: (context) => CategoryPage(),
  TaskDetailPage.route: (context) => TaskDetailPage(),
};
