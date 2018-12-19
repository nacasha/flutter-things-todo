import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/data/model/models.dart';
import 'package:built_collection/built_collection.dart';
import 'package:memoize/memoize.dart';

class TaskSelectors {
  static final taskActiveList = memo1((AppState state) => (
    state.task.tasks.where(
      (task) => task.status == TaskStatus.active
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
}
