import 'package:evernotes/blocs/bloc_exports.dart';
import 'package:evernotes/constants/global_variables.dart';
import 'package:evernotes/screens/recycle_bin.dart';
import 'package:evernotes/screens/tabs_screen.dart';
import 'package:evernotes/screens/pending_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              // decoration: const BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.topRight,
              //     end: Alignment.bottomRight,
              //     colors: [
              //       // Color(0xFFFAE5EA),
              //       Color.fromARGB(255, 61, 9, 30),
              //       // Color(0xFFF9AECA),
              //       // Color(0xFFF992A9),
              //       Color.fromARGB(255, 247, 247, 247),
              //     ],
              //   ),
              // ),
              color: GlobalVariables.themeColor,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                    TabsScreen.id,
                  ),
                  child: ListTile(
                    hoverColor: Colors.blueGrey,
                    leading: const Icon(
                      Icons.folder_special,
                      color: Colors.amber,
                    ),
                    title: const Text('My Tasks'),
                    trailing: Text(
                        '${state.pendingTasks.length}  | ${state.completedTasks.length} '),
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
                    leading: const Icon(
                      Icons.recycling,
                      color: Colors.purpleAccent,
                    ),
                    title: const Text('My Bin'),
                    trailing: Text('${state.removedTasks.length}'),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                    value: state.switchValue,
                    onChanged: (newValue) {
                      newValue
                          ? context.read<SwitchBloc>().add(SwitchOnEvent())
                          : context.read<SwitchBloc>().add(SwitchOffEvent());
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
