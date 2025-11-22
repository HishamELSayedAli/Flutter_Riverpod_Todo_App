import 'package:to_do_flutter/features/home/model/task_model.dart';

class TaskState {
  final List<TaskModel> tasks;

  TaskState({required this.tasks});

  List<TaskModel> get newTasks =>
      tasks.where((e) => !e.isDone && !e.isArchieved).toList();
 
  List<TaskModel> get doneTasks =>
      tasks.where((e) => e.isDone && !e.isArchieved).toList();
      
  List<TaskModel> get archievedTasks =>
      tasks.where((e) => e.isArchieved).toList();
      

  TaskState copyWith({List<TaskModel>? tasks}) {
    return TaskState(tasks: tasks ?? this.tasks);
  }
}
