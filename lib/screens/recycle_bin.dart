import 'package:evernotes/constants/global_variables.dart';
import 'package:evernotes/screens/my_drawer.dart';
import 'package:evernotes/widgets/tasks_list.dart';
import 'package:flutter/material.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

    static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
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
        children: const [
          Center(
            child: Chip(
              label: Text(
                'Tasks',
                style: TextStyle(color: GlobalVariables.secondaryColor),
              ),
            ),
          ),
          TasksList(
            taskList: [],
          )
        ],
      ),
    );
  }
}
