
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:realm/realm.dart';
import 'package:to_do_flutter/core/widget/my_form_feild.dart';
import 'package:to_do_flutter/features/home/model/task_model.dart';
import 'package:to_do_flutter/features/home/provider/task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key, this.task});

  final TaskModel? task;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final dueDateController = TextEditingController();

  @override
  void initState() {
    if (widget.task != null) {
      titleController.text = widget.task!.title;
      subtitleController.text = widget.task!.subtitle;
      dueDateController.text = widget.task!.dueDate;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task Screen")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              // tow form
              //title
              myFormFeild(hint: "Title", controller: titleController),
              SizedBox(height: 16),

              //subTitle
              myFormFeild(hint: "Subtitle", controller: subtitleController),

              SizedBox(height: 16),

              //date
              myFormFeild(
                hint: "Due Date",
                controller: dueDateController,
                readonly: true,
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 360)),
                    initialDate: DateTime.now(),
                  ).then((value) {
                    if (value != null) {
                      dueDateController.text = DateFormat()
                          .add_yMd()
                          .add_jm()
                          .format(value);
                    }
                  });
                },
              ),
              SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: Consumer(
                  builder: (context, ref, _) {
                    return ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          final task = TaskModel(
                            widget.task!= null ? widget.task!.id : ObjectId(),
                            titleController.text,
                            subtitleController.text,
                            dueDateController.text,
                            isArchieved: widget.task?.isArchieved ?? false,
                            isDone: widget.task?.isDone ?? false,
                          );
                          ref.read(tasksProvider.notifier).create(task);
                          Navigator.pop(context, true);
                        }
                      },
                      child: Text(
                        widget.task == null ? "Add Task" : "Edit Task",
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
