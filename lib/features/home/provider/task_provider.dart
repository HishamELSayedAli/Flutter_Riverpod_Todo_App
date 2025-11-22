import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_flutter/features/home/model/task_model.dart';
import 'package:to_do_flutter/features/home/provider/task_state.dart';
import 'package:to_do_flutter/features/home/repo/task_repo.dart';

class Tasks extends Notifier<TaskState> {
  @override
  TaskState build() {
    return TaskState(tasks: _tasksRepo.getAllTasks());
  }

  // getter
  TaskRepository get _tasksRepo => ref.read(taskRepositoryProvider);

  //!crud for state

  void create(TaskModel task) {
    _tasksRepo.ceate(task);
    refreshTasks();
  }

  //!read
  List<TaskModel> getAll() {
    return _tasksRepo.getAllTasks();
  }

  //!delete
  void delete(TaskModel task) {
    _tasksRepo.delete(task);
    refreshTasks();
  }

  //!update
  void update(TaskModel task) {
    _tasksRepo.update(task);
    refreshTasks();
  }

  void refreshTasks() {
    state = state.copyWith(tasks: getAll());
  }
}

final tasksProvider = NotifierProvider<Tasks, TaskState>(Tasks.new);
