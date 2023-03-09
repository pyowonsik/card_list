import 'package:card_list/card_list_bloc/card_list_bloc.dart';
import 'package:card_list/card_list_bloc/card_list_event.dart';
import 'package:card_list/card_list_bloc/card_list_state.dart';
import 'package:card_list/card_list_widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late CardListBloc cardListBloc;

class CardListScreen extends StatelessWidget {
  // const CardListScreen({super.key});
  late CardListBloc cardListBloc;
  CardListScreen({super.key});

  void _showMessage(BuildContext context, CardListState state) {
    final todoController = TextEditingController();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: const Text('Title'),
          content: BlocBuilder<CardListBloc, CardListState>(
            bloc: cardListBloc,
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
                print(todoController.text);

                // addTodo 이벤트 파라미터로 todoContorller.text 넣어서 추가 버튼누르면 List에 추가
                // context.read<CardListBloc>().add(AddCardEvent());
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
    cardListBloc = context.read<CardListBloc>();
    return Scaffold(
      body: BlocBuilder<CardListBloc, CardListState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    _showMessage(context, state);
                  },
                  child: const Text('추가')),
              const SizedBox(height: 30),
              Expanded(
                  child: ListView.builder(
                itemCount: state.numbers.length,
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
                          child: CardWidget(index: index, state: state),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          context
                              .read<CardListBloc>()
                              .add(AddCardNumberEvent(index: index));
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
