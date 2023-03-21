import 'package:todo_list/bloc/todo_list_event.dart';
import 'package:todo_list/screen/check_list_screen.dart';
import 'package:todo_list/screen/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo_list_bloc.dart';
import 'bloc/todo_list_state.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return BlocBuilder<TodoListBloc, TodoListState>(
      builder: (context, state) {
        return MaterialApp(
          home: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  title: const Center(
                      child: Text('TODOS', style: TextStyle(fontSize: 30))),
                  bottom: const TabBar(tabs: [
                    Tab(text: '전체 보기'),
                    Tab(text: '해야할 일'),
                    Tab(text: '완료한 일'),
                  ]),
                ),
                body: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: searchController,
                        onChanged: (val) {
                          context.read<TodoListBloc>().add(
                                SearchTodoEvent(
                                    todoName: val, todo: state.todoList),
                              );
                        },
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            ListScreen(
                                todoList: state.todoList
                                    .where((e) =>
                                        e.todo.contains(searchController.text))
                                    .toList()),
                            CheckListScreen(
                                todoList: state.todoList
                                    .where((e) =>
                                        e.todo
                                            .contains(searchController.text) &&
                                        e.isChecked == false)
                                    .toList()),
                            CheckListScreen(
                                todoList: state.todoList
                                    .where((e) =>
                                        e.todo
                                            .contains(searchController.text) &&
                                        e.isChecked == true)
                                    .toList()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
