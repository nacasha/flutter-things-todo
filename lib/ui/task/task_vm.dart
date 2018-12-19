import 'package:redux/redux.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/redux/task/task_actions.dart';
import 'package:thingstodo/redux/task/task_selectors.dart';

class TaskVM {
  final List<TaskModel> taskActiveList;
  final List<TaskModel> taskLaterList;
  final List<TaskModel> taskDoneList;

  final Function createTask;
  final Function removeTask;
  final Function updateTask;

  TaskVM({
    @required this.taskActiveList,
    @required this.taskLaterList,
    @required this.taskDoneList,
    @required this.createTask,
    @required this.removeTask,
    @required this.updateTask,
  });

  static TaskVM fromStore(Store<AppState> store) {
    final state = store.state;
    final dispatch = store.dispatch;

    return TaskVM(
      // State
      taskActiveList: TaskSelectors.taskActiveList(state),
      taskLaterList: TaskSelectors.taskLaterList(state),
      taskDoneList: TaskSelectors.taskDoneList(state),

      // Methods
      createTask: (TaskModel task) {
        dispatch(CreateTaskAction(task: task));
      },
      removeTask: (TaskModel task) {
        dispatch(RemoveTaskAction(task: task));
      },
      updateTask: (TaskModel task, TaskModel updates) {
        dispatch(UpdateTaskAction(task: task, updates: updates));
      },
    );
  }
}
