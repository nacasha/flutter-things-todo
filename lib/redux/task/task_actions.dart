import 'package:thingstodo/data/model/models.dart';

class CreateTaskAction {
  final TaskModel task;

  CreateTaskAction({
    this.task
  });
}

class UpdateTaskAction {
  final TaskModel task;
  final TaskModel updates;

  UpdateTaskAction({
    this.task,
    this.updates
  });
}

class RemoveTaskAction {
  final TaskModel task;

  RemoveTaskAction({
    this.task
  });
}
