import 'package:date_utils/date_utils.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/data/model/models.dart';
import 'package:memoize/memoize.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class TaskSelectors {
  static final isActive = (
    memo1((task) => task.status == TaskStatus.active)
  );

  static sortTask(List<TaskModel> tasks) {
    tasks.sort((TaskModel a, TaskModel b) {
      final dA = a.date?.toLocal();
      final dB = b.date?.toLocal();

      if (dA.isAfter(dB)) {
        return 1;
      }
      return 0;
    });

    return tasks;
  }

  static final taskActiveList = memo1((AppState state) => (
    state.task.tasks.where(
      (task) => isActive(task)
    ).toList()
  ));

  static final taskDoneList = memo1((AppState state) => (
    state.task.tasks.where(
      (task) => task.status == TaskStatus.done
    ).toList()
  ));

  static final taskLaterList = memo1((AppState state) => (
    state.task.tasks.where(
      (task) => task.status == TaskStatus.later
    ).toList()
  ));

  static dailyTask(AppState state) {
    final tasks = state.task.tasks;
    final selectedDate = state.calendar.selectedDate?.toLocal();

    final build = memo2((tasks, selectedDate) {
      return tasks.where(
        (task) => (
          isActive(task) &&
          (Utils.isSameDay(task.date.toLocal(), selectedDate))
        )
      ).toList();
    });

    final List<TaskModel> result = build(tasks, selectedDate);

    return sortTask(result);
  }

  static weeklyTask(AppState state) {
    final tasks = state.task.tasks;
    final date = state.calendar.date?.toLocal();

    final build = memo2((tasks, date) {
      return tasks.where(
        (task) => isActive(task) &&
        (Utils.isSameWeek(task.date.toLocal(), date))
      ).toList();
    });

    final List<TaskModel> result = build(tasks, date);
    final List<TaskModel> sortedTask = sortTask(result);

    final groupOfTasks = groupBy(sortedTask, (TaskModel task) => (
      DateFormat('dd MMMM').format(task.date.toLocal())
    ));

    return groupOfTasks;
  }

  static monthlyTask(AppState state) {
    final tasks = state.task.tasks;
    final selectedDate = state.calendar.selectedDate?.toLocal();

    final build = memo2((tasks, selectedDate) {
      return tasks.where(
        (task) =>isActive(task)
      ).toList();
    });

    final List<TaskModel> result = build(tasks, selectedDate);

    return sortTask(result);
  }
}
