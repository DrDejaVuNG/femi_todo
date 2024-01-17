import 'package:femi_app/app/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';

TodoController get todoController => Super.init(TodoController());

class TodoController extends SuperController {
  final todoList = <TodoModel>[].rx;

  var title = '';
  var text = '';

  void addTodo() {
    if (title == '' || text == '') {
      ScaffoldMessenger.of(ctrlContext).showSnackBar(
        const SnackBar(
          content: Text('Please fill empty fields'),
        ),
      );
      return;
    }
    final todo = TodoModel(
      id: '${todoList.length}',
      title: title,
      text: text,
      created: DateTime.now().toString(),
    );

    todoList.add(todo);
    ScaffoldMessenger.of(ctrlContext).showSnackBar(
      const SnackBar(
        content: Text('Successfully removed todo'),
      ),
    );
  }

  void removeTodo(TodoModel todo) {
    todoList.remove(todo);
    ScaffoldMessenger.of(ctrlContext).showSnackBar(
      const SnackBar(
        content: Text('Successfully removed todo'),
      ),
    );
  }
}
