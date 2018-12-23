import 'package:date_utils/date_utils.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/data/model/models.dart';
import 'package:memoize/memoize.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:built_collection/built_collection.dart';

class TaskSelectors {
  final AppState state;

  TaskSelectors(this.state) {
    _tasks = state.task.tasks;
  }

  BuiltList<TaskModel> _tasks;

  // Filters
  final _isActive = (task) => task.status == TaskStatus.active;
  final _isLater = (task) => task.status == TaskStatus.later;
  final _isDone = (task) => task.status == TaskStatus.done;
  final _isImportant = (task) => task.important == true;

  List<TaskModel> _sortTask(List<TaskModel> tasks) {
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

  final groupTask = memo1((List<TaskModel> tasks) =>
    groupBy(tasks, (TaskModel task) => (
      DateFormat('dd MMMM').format(task.date.toLocal())
    ))
  );


  // Selectors
  get doneTask {
    final build = memo1((tasks) => (
      tasks.where((task) => _isDone(task)).toList()
    ));

    final List<TaskModel> result = build(_tasks);
    final List<TaskModel> sortedTask = _sortTask(result);

    return groupTask(sortedTask);
  }

  get laterTask {
    final build = memo1((tasks) => (
      tasks.where((task) => _isLater(task)).toList()
    ));

    final List<TaskModel> result = build(_tasks);
    final List<TaskModel> sortedTask = _sortTask(result);

    return groupTask(sortedTask);
  }

  get importantTask {
    final build = memo1((tasks) => (
      tasks.where((task) => _isImportant(task)).toList()
    ));

    final List<TaskModel> result = build(_tasks);
    final List<TaskModel> sortedTask = _sortTask(result);

    return groupTask(sortedTask);
  }

  get dailyTask {
    final today = DateTime.now().toLocal();

    final build = memo2((tasks, today) {
      return tasks.where(
        (task) => (
          _isActive(task) &&
          (Utils.isSameDay(task.date.toLocal(), today))
        )
      ).toList();
    });

    final List<TaskModel> result = build(_tasks, today);

    return _sortTask(result);
  }

  get weeklyTask {
    final date = state.calendar.date?.toLocal();

    final build = memo2((tasks, date) {
      return tasks.where(
        (task) => _isActive(task) &&
        (Utils.isSameWeek(task.date.toLocal(), date))
      ).toList();
    });

    final List<TaskModel> result = build(_tasks, date);
    final List<TaskModel> sortedTask = _sortTask(result);

    return groupTask(sortedTask);
  }

  get monthlyTask {
    final selectedDate = state.calendar.selectedDate?.toLocal();

    final build = memo2((tasks, selectedDate) {
      return tasks.where(
        (task) =>_isActive(task)
      ).toList();
    });

    final List<TaskModel> result = build(_tasks, selectedDate);

    return _sortTask(result);
  }
}
