// structurer for date
import 'package:realm/realm.dart';

part 'task_model.realm.dart';

@RealmModel()

class _TaskModel {
  @PrimaryKey()
  late ObjectId id;
  late String title;
  late String subtitle;
  late String dueDate;
  
  
  // optional value 
  bool isArchieved = false;
  bool isDone = false;

  
}

extension CopyWith on TaskModel {
  TaskModel copyWith({
    String? title,
    String? subtitle,
    String? dueDate,
    bool? isDone,
    bool? isArchieved,
  }) {
    return TaskModel(
      id,
      title ?? this.title,
      subtitle ?? this.subtitle,
      dueDate ?? this.dueDate,
      isDone: isDone ?? this.isDone,
      isArchieved: isArchieved ?? this.isArchieved,
    );
  }
}
