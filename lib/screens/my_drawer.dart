import 'package:evernotes/blocs/bloc_exports.dart';
import 'package:evernotes/constants/global_variables.dart';
import 'package:evernotes/screens/recycle_bin.dart';
import 'package:evernotes/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFAE5EA),
                    Color(0xFFCAEDFA),
                    Color(0xFFF9AECA),
                    Color(0xFFF992A9),
                  ],
                ),
              ),
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                    TasksScreen.id,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text('My Tasks'),
                    trailing: Text('${state.allTasks.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                    RecycleBin.id,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('My Bin'),
                    trailing: Text('${state.removedTasks.length}'),
                  ),
                );
              },
            ),
            Switch(
                value: switchValue,
                onChanged: (newValue) {
                  setState(() {
                    switchValue = newValue;
                  });
                })
          ],
        ),
      ),
    );
  }
}
