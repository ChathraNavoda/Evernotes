import 'package:evernotes/constants/global_variables.dart';
import 'package:evernotes/model/task.dart';

import 'package:evernotes/screens/my_drawer.dart';
import 'package:evernotes/widgets/tasks_list.dart';
import 'package:flutter/material.dart';
import '../blocs/bloc_exports.dart';

class CompletedTasksScreen extends StatelessWidget {
  CompletedTasksScreen({Key? key}) : super(key: key);

  static const id = 'tasks_screen';

  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.completedTasks;

        return Scaffold(
          // appBar: AppBar(
          //   title: const Text('Tasks app'),
          // ),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${taskList.length} : Tasks',
                    style:
                        const TextStyle(color: GlobalVariables.secondaryColor),
                  ),
                ),
              ),
              TasksList(taskList: taskList)
            ],
          ),
        );
      },
    );
  }
}
