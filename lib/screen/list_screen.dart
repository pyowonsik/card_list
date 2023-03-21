import 'package:todo_list/bloc/todo_list_bloc.dart';
import 'package:todo_list/bloc/todo_list_event.dart';
import 'package:todo_list/bloc/todo_list_state.dart';
import 'package:todo_list/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/todo_widget.dart';

class ListScreen extends StatelessWidget {
  final List<Todo> todoList;
  const ListScreen({super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    TodoListBloc todoListBloc = context.read<TodoListBloc>();
    final todoController = TextEditingController();

    return BlocBuilder<TodoListBloc, TodoListState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              title: const Text('Todo 입력 '),
                              content: TextField(
                                controller: todoController,
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      child: const Text("추가"),
                                      onPressed: () {
                                        todoListBloc.add(AddTodoEvent(
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
                    child: const Text('추가')),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      context.read<TodoListBloc>().add(RemoveAllTodosEvent());
                    },
                    child: const Text('모두 삭제')),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index) {
                return Draggable(
                    data: index,
                    onDragStarted: () {
                      todoListBloc.add(DragStartEvent(index: index));
                    },
                    onDraggableCanceled: (_, __) {
                      todoListBloc.add(DragEndEvent());
                    },
                    onDragCompleted: () {
                      todoListBloc.add(DragEndEvent());
                    },
                    feedback: Material(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width),
                        child: TodoWidget(
                          todo: todoList[index],
                        ),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                title: const Text('변경할 Todo 입력 '),
                                content: TextField(
                                  controller: todoController,
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
                                            todo: todoController.text,
                                          ));
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
                      child: DragTarget(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return TodoWidget(
                            todo: todoList[index],
                          );
                        },
                        onMove: (detail) {
                          if (state.isDragging) {
                            context
                                .read<TodoListBloc>()
                                .add(DragEvent(index: index));
                          }
                        },
                      ),
                    ));
              },
            )),
          ],
        ),
      );
    });
  }
}
