import 'package:card_list/card_list_bloc/card_list_bloc.dart';
import 'package:card_list/card_list_bloc/card_list_event.dart';
import 'package:card_list/card_list_bloc/card_list_state.dart';
import 'package:card_list/card_list_widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late CardListBloc cardListBloc; // late로 선언

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});
  void addTodo(BuildContext context, CardListState state) {
    final todoController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
            ElevatedButton(
              child: const Text("추가"),
              onPressed: () {
                cardListBloc.add(AddTodoEvent(todo: todoController.text));
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    cardListBloc = context.read<CardListBloc>(); // bloc 등록
    return Scaffold(
      body: BlocBuilder<CardListBloc, CardListState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    addTodo(context, state);
                  },
                  child: const Text('추가')),
              const SizedBox(height: 30),
              Expanded(
                  child: ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Draggable(
                      data: index,
                      onDragStarted: () {
                        print(state.dragTodo);
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
                          child: CardWidget(index: index, state: state),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // context
                          // .read<CardListBloc>()
                          // .add(AddCardNumberEvent(index: index));
                        },
                        child: DragTarget(
                          builder: (
                            BuildContext context,
                            List<dynamic> accepted,
                            List<dynamic> rejected,
                          ) {
                            return CardWidget(index: index, state: state);
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
      }),
    );
  }
}
