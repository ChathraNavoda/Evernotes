import 'package:evernotes/constants/global_variables.dart';
import 'package:evernotes/screens/recycle_bin.dart';
import 'package:evernotes/screens/tasks_screen.dart';
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
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                TasksScreen.id,
              ),
              child: const ListTile(
                leading: Icon(Icons.folder_special),
                title: Text('My Tasks'),
                trailing: Text('0'),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                RecycleBin.id,
              ),
              child: const ListTile(
                leading: Icon(Icons.delete),
                title: Text('My Bin'),
                trailing: Text('0'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
