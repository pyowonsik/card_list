import 'package:todo_list/bloc/todo_list_bloc.dart';
import 'package:todo_list/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_list_event.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Checkbox(
                value: todo.isChecked,
                onChanged: (value) {
                  context
                      .read<TodoListBloc>()
                      .add(CheckTodoEvent(time: todo.time));
                }),
            (todo.isChecked)
                ? Text(
                    todo.todo,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                : Text(
                    todo.todo,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<TodoListBloc>()
                      .add(RemoveTodoEvent(time: todo.time));
                },
                child: const Icon(Icons.delete)),
          ]),
        ),
      ),
    );
  }
}
