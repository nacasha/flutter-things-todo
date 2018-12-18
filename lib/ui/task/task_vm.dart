import 'package:redux/redux.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:built_collection/built_collection.dart';

import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/redux/task/task_actions.dart';

class TaskVM {
  final BuiltList<TaskModel> tasks;
  final Function createTask;
  final Function removeTask;
  final Function updateTaskStatus;

  TaskVM({
    @required this.tasks,
    @required this.createTask,
    @required this.removeTask,
    @required this.updateTaskStatus,
  });

  static TaskVM fromStore(Store<AppState> store) {
    final state = store.state;

    return TaskVM(
      tasks: state.task.tasks,
      createTask: (TaskModel task) {
        store.dispatch(CreateTaskAction(task: task));
      },
      removeTask: (TaskModel task) {
        store.dispatch(RemoveTaskAction(task: task));
      },
      updateTaskStatus: (TaskModel task) {
        store.dispatch(RemoveTaskAction(task: task));
      },
    );
  }
}
