import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_flutter/core/config/realm_config.dart';
import 'core/nav/routes.dart';
import 'package:to_do_flutter/features/home/view/home.dart';
import 'features/add_task/view/add_task_screen.dart';

void main() {
  initRealm();
  runApp(ProviderScope(child: const MainApp()));

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        Routes.home: (context) => HomeScreen(),
        Routes.addTask: (context) => AddTaskScreen(),
      },
    );
  }
}
