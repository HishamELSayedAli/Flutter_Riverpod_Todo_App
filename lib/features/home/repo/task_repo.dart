import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_flutter/core/config/realm_config.dart';
import 'package:to_do_flutter/features/home/model/task_model.dart';


// add & provided date
//* static provider
class TaskRepository {
 
  //crud

  void ceate(TaskModel task) {
    realm.write(() {
      realm.add(task);
    });
  }

  //read
  List <TaskModel> getAllTasks() {
    final realmTasks = realm.all<TaskModel>();
    return realmTasks.toList();
  }
  
  //update
  void update(TaskModel task) {
    realm.write(() {
      realm.add(task, update: true);
    });
  }

  //delete 
  void delete(TaskModel task) {
    realm.write(() {
      realm.delete(task); 
    });
  }

}
final taskRepositoryProvider = Provider<TaskRepository>((ref)=>TaskRepository());
