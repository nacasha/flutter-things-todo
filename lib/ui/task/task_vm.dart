import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/redux/task/task_actions.dart';
import 'package:thingstodo/redux/task/task_selectors.dart';

class TaskVM {
  final BuiltList<TaskModel> tasks;
  final BuiltList<CategoryModel> categories;

  final int totalDailyTask;
  final int totalDailyTaskDone;

  final Map<String, List<TaskModel>> doneTask;
  final Map<String, List<TaskModel>> laterTask;
  final Map<String, List<TaskModel>> importantTask;

  final List<TaskModel> dailyTask;
  final List<TaskModel> monthlyTask;
  final Map<String, List<TaskModel>> weeklyTask;

  final Function createTask;
  final Function removeTask;
  final Function updateTask;

  TaskVM({
    @required this.tasks,
    @required this.categories,

    @required this.totalDailyTask,
    @required this.totalDailyTaskDone,

    @required this.doneTask,
    @required this.laterTask,
    @required this.importantTask,

    @required this.dailyTask,
    @required this.weeklyTask,
    @required this.monthlyTask,

    @required this.createTask,
    @required this.removeTask,
    @required this.updateTask,
  });

  static TaskVM fromStore(Store<AppState> store) {
    final state = store.state;
    final dispatch = store.dispatch;

    return TaskVM(
      tasks: state.task.tasks,
      categories: state.category.categories,

      totalDailyTask: TaskSelectors(state).totalDailyTask,
      totalDailyTaskDone: TaskSelectors(state).totalDailyTaskDone,

      doneTask: TaskSelectors(state).doneTask,
      laterTask: TaskSelectors(state).laterTask,
      importantTask: TaskSelectors(state).importantTask,

      dailyTask: TaskSelectors(state).dailyTask,
      weeklyTask: TaskSelectors(state).weeklyTask,
      monthlyTask: TaskSelectors(state).monthlyTask,

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
