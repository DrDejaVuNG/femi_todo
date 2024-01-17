import 'package:femi_app/app/interaction/interaction.dart';
import 'package:femi_app/app/interface/interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';

class TodoView extends SuperWidget<TodoController> {
  const TodoView({super.key});

  @override
  TodoController initController() => todoController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Femi's Todos")),
      body: SuperBuilder(
        builder: (context) {
          if (controller.todoList.isEmpty) {
            return Center(
              child: Text(
                '${controller.todoList.length} todos to show',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          }
          return ListView.builder(
            itemCount: controller.todoList.length,
            itemBuilder: (context, index) {
              return TodoTile(todo: controller.todoList[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Create a new todo'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Title',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (val) => controller.title = val,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Text',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (val) => controller.text = val,
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      controller.addTodo();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Save'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
