import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';

class SearchVM {
  final List<TaskModel> tasks;

  SearchVM({
    @required this.tasks,
  });

  static SearchVM fromStore(Store<AppState> store) {
    final state = store.state;

    return SearchVM(
      tasks: state.task.tasks.toList(),
    );
  }
}
