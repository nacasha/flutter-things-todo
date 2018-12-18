import 'package:thingstodo/data/model/models.dart';

class CreateTaskAction {
  final TaskModel task;

  CreateTaskAction({
    this.task
  });
}

class UpdateTaskAction {
  final TaskModel task;

  UpdateTaskAction({
    this.task
  });
}

class RemoveTaskAction {
  final TaskModel task;

  RemoveTaskAction({
    this.task
  });
}
