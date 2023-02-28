import 'package:evernotes/model/task.dart';
import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;

  const PopupMenu({
    Key? key,
    required this.cancelOrDeleteCallback,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? ((context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.brown,
                    ),
                    label: const Text('Edit'),
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.bookmark,
                      color: Colors.blueAccent,
                    ),
                    label: const Text('Add to Bookmarks'),
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                      label: const Text('Delete'),
                    ),
                    onTap: cancelOrDeleteCallback),
              ])
          : (context) => [
                PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(
                        Icons.restore_from_trash,
                        color: Colors.greenAccent,
                      ),
                      label: const Text('Restore'),
                    ),
                    onTap: () {}),
                PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                      label: const Text('Delete Forever'),
                    ),
                    onTap: cancelOrDeleteCallback),
              ],
    );
  }
}
