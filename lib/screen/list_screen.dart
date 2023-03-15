import 'package:card_list/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/card_list_bloc.dart';
import '../bloc/card_list_event.dart';
import '../bloc/card_list_state.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CardListBloc cardListBloc = context.read<CardListBloc>();
    final todoController = TextEditingController();
    return BlocBuilder<CardListBloc, CardListState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          title: const Text('Todo 입력 '),
                          content: BlocBuilder<CardListBloc, CardListState>(
                            bloc: cardListBloc, // showDialog에서 bloc 등록
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
                                  child: const Text("추가"),
                                  onPressed: () {
                                    cardListBloc.add(AddTodoEvent(
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
            const SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (BuildContext context, int index) {
                return Draggable(
                    data: index,
                    onDragStarted: () {
                      context
                          .read<CardListBloc>()
                          .add(DragStartEvent(index: index));
                    },
                    onDraggableCanceled: (_, __) {
                      context.read<CardListBloc>().add(DragEndEvent());
                    },
                    onDragCompleted: () {
                      context.read<CardListBloc>().add(DragEndEvent());
                    },
                    feedback: Material(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width),
                        child: CardWidget(
                          index: index,
                          state: state,
                          listType: 'all',
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
                                content:
                                    BlocBuilder<CardListBloc, CardListState>(
                                  bloc: cardListBloc, // showDialog에서 bloc 등록
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
                                          cardListBloc.add(ChangeTodoEvent(
                                            id: state.todoList[index].id,
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
                          return CardWidget(
                            index: index,
                            state: state,
                            listType: 'all',
                          );
                        },
                        onMove: (detail) {
                          if (state.isDragging) {
                            context
                                .read<CardListBloc>()
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
