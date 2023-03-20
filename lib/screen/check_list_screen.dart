import 'package:todo_list/bloc/todo_list_bloc.dart';
import 'package:todo_list/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_list_event.dart';
import '../bloc/todo_list_state.dart';
import '../widget/todo_widget.dart';

class CheckListScreen extends StatelessWidget {
  final List<Todo> todoList;
  const CheckListScreen({super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    TodoListBloc todoListBloc = context.read<TodoListBloc>();
    final todoController = TextEditingController();

    return BlocBuilder<TodoListBloc, TodoListState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              title: const Text('변경할 Todo 입력 '),
                              content: BlocBuilder<TodoListBloc, TodoListState>(
                                bloc: todoListBloc, // showDialog에서 bloc 등록
                                builder: (context, state) {
                                  return TextField(
                                    controller: todoController,
                                  );
                                },
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      child: const Text("변경"),
                                      onPressed: () {
                                        todoListBloc.add(ChangeTodoNameEvent(
                                            time: todoList[index].time,
                                            todo: todoController.text));
                                        Navigator.pop(context);
                                      },
                                    ),
                                    const SizedBox(width: 15),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('취소'),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          });
                      todoController.clear();
                    },
                    child: TodoWidget(todo: todoList[index]));
              },
            )),
          ],
        ),
      );
    });
  }
}
