import 'package:evernotes/constants/global_variables.dart';
import 'package:evernotes/model/task.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);

  List<Task> taskList = [
    Task(title: 'Task1'),
    Task(title: 'Task2'),
    Task(title: 'Task3'),
    Task(title: 'Task4'),
    Task(title: 'Task5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('✏️ Evernotes'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Chip(
              label: Text(
                'Tasks:',
                style: TextStyle(color: GlobalVariables.secondaryColor),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  var task = taskList[index];
                  return ListTile(
                    title: Text(task.title),
                    trailing: Checkbox(value: task.isDone, onChanged: (value){}),
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
