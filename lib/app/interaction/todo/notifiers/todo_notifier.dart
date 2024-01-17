import 'package:femi_app/app/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';

TodoNotifier get todoNotifier => Super.init(TodoNotifier());

class TodoNotifier extends RxNotifier<List<TodoModel>> {
  @override
  List<TodoModel> initial() {
    return [];
  }

  void addTodo({
    required BuildContext context,
    required String title,
    required String text,
  }) {
    if (title == '' || text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill empty fields'),
        ),
      );
      return;
    }
    final todo = TodoModel(
      id: '${state.length}',
      title: title,
      text: text,
      created: DateTime.now().toString(),
    );

    state = [...state, todo];
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successfully added todo'),
      ),
    );
  }

  void removeTodo({
    required BuildContext context,
    required TodoModel todo,
  }) {
    final list = state;
    list.remove(todo);
    state = list;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successfully removed todo'),
      ),
    );
  }
}
