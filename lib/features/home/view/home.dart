import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_flutter/core/nav/routes.dart';
import 'package:to_do_flutter/features/home/provider/task_provider.dart';
import 'package:to_do_flutter/features/home/view/widget/tasks_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Todo App")),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.addTask).then((value) {
                  if (value == true) {
                    final refContainer = ProviderScope.containerOf(
                      context,
                      listen: false,
                    );
                    refContainer.read(tasksProvider.notifier).refreshTasks();
                  }
                  
                });
              },
              icon: Icon(Icons.add),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(child: Text("New")),
              Tab(child: Text("Done")),
              Tab(child: Text("Archived")),
            ],
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TabBarView(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(tasksProvider);

                  return TasksWidget(tasks: state.newTasks);
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(tasksProvider);
                  return TasksWidget(tasks: state.doneTasks);
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(tasksProvider);

                  return TasksWidget(tasks: state.archievedTasks);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
