import 'package:evernotes/constants/global_variables.dart';
import 'package:evernotes/screens/my_drawer.dart';
import 'package:evernotes/widgets/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc_exports.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Recycle Bin 🗑️'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            )
          ],
        ),
        drawer: const MyDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${state.removedTasks.length}Tasks',
                  style: const TextStyle(
                      color: GlobalVariables.secondaryColorlight),
                ),
              ),
            ),
            TasksList(
              taskList: state.removedTasks,
            )
          ],
        ),
      );
    });
  }
}
