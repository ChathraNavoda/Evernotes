import 'package:evernotes/screens/add_task_sceen.dart';
import 'package:evernotes/screens/completed_tasks_screen.dart';
import 'package:evernotes/screens/favorite_tasks_screen.dart';
import 'package:evernotes/screens/my_drawer.dart';
import 'package:evernotes/screens/pending_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({super.key});
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {
      'pageName': PendingTasksScreen(),
      "title": "Pending Tasks",
    },
    {
      'pageName': CompletedTasksScreen(),
      "title": "Completed Tasks",
    },
    {
      'pageName': FavoriteTasksScreen(),
      "title": "Favorite Tasks",
    },
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddTaskScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle_rounded),
            label: "Pending Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: "Completed Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favotite Tasks",
          ),
        ],
      ),
    );
  }
}
