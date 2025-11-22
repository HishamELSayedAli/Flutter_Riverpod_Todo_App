import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_flutter/features/add_task/view/add_task_screen.dart';
import 'package:to_do_flutter/features/home/model/task_model.dart';
import 'package:to_do_flutter/features/home/provider/task_provider.dart';

class TasksWidget extends StatelessWidget {
  const TasksWidget({super.key, required this.tasks});

  final List<TaskModel> tasks;
  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty? 
    Center(
      child: Text("NO Tasks Here!"),

    ): 
    
    ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 12),
      itemCount: tasks.length,
      separatorBuilder: (context, index) => SizedBox(height: 4),
      itemBuilder: (context, index) {
        return TaskWidget(task: tasks[index]);
      },
    );
  }
}

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task});

  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> AddTaskScreen(task: task,))),
        title: Text(task.title),
        subtitle: Text(task.subtitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              builder: (context, ref, _) {
                return Row(
                
                  children: [
                    Padding(
                      padding: EdgeInsets.zero,
                      child: IconButton(
                        onPressed: () {
                          ref
                              .read(tasksProvider.notifier)
                              .update(task.copyWith(isDone: !task.isDone));
                        },
                        icon: Icon(
                          task.isDone
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(tasksProvider.notifier)
                            .update(
                              task.copyWith(isArchieved: !task.isArchieved),
                            );
                      },
                      icon: Icon(
                        task.isArchieved ? Icons.restore : Icons.delete,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
