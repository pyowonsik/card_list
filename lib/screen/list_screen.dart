import 'package:card_list/card/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/card_list_bloc.dart';
import '../bloc/card_list_event.dart';
import '../bloc/card_list_state.dart';
import '../widget/card_widget.dart';

class ListScreen extends StatelessWidget {
  final List<CardModel> cardList;
  const ListScreen({super.key, required this.cardList});

  @override
  Widget build(BuildContext context) {
    CardListBloc cardListBloc = context.read<CardListBloc>();
    final todoController = TextEditingController();
    final searchController = TextEditingController();
    return BlocBuilder<CardListBloc, CardListState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextFormField(
              controller: searchController,
              onChanged: (val) {
                context.read<CardListBloc>().add(SearchCardEvent(card: val));
              },
            ),
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
                                    cardListBloc.add(AddCardEvent(
                                        card: todoController.text));
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
              itemCount: cardList.length,
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
                          card: cardList[index],
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
                                          cardListBloc.add(ChangeCardNameEvent(
                                            time: cardList[index].time,
                                            card: todoController.text,
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
                            card: cardList[index],
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
