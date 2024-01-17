import 'package:femi_app/app/domain/domain.dart';
import 'package:femi_app/app/interaction/interaction.dart';
import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) => todoController.removeTodo(todo),
      key: Key(todo.id),
      child: ListTile(
        leading: Text(todo.id),
        title: Text(todo.title),
        subtitle: Text(todo.text),
        trailing: Text(todo.created),
      ),
    );
  }
}
