import 'dart:math';
import 'package:card_list/card_list_bloc/card_list_bloc.dart';
import 'package:card_list/card_list_bloc/card_list_event.dart';
import 'package:card_list/card_list_bloc/card_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  context.read<CardListBloc>().add(AddIndexEvent());
                },
                child: const Text('추가')),
            const SizedBox(height: 30),
            BlocBuilder<CardListBloc, CardListState>(
              builder: (context, state) {
                return Expanded(
                    child: ListView.builder(
                  itemCount: state.numbers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Draggable(
                        data: index,
                        onDragStarted: () {
                          // dragNumber = numbers[index];
                          // dragIndex = index;
                          context
                              .read<CardListBloc>()
                              .add(DragInfoEvent(index: index));
                          context.read<CardListBloc>().add(IsDraggingEvent());
                        },
                        onDraggableCanceled: (_, __) {
                          context
                              .read<CardListBloc>()
                              .add(IsNotDraggingEvent());
                        },
                        onDragCompleted: () {
                          context
                              .read<CardListBloc>()
                              .add(IsNotDraggingEvent());
                        },
                        feedback: Material(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width),
                            child: SizedBox(
                              height: 50,
                              child: Card(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        state.numbers[index].toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('삭제')),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<CardListBloc>()
                                .add(AddNumberEvent(index: index));
                          },
                          child: DragTarget(
                            builder: (
                              BuildContext context,
                              List<dynamic> accepted,
                              List<dynamic> rejected,
                            ) {
                              return SizedBox(
                                height: 50,
                                child: Card(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            state.numbers[index].toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                context
                                                    .read<CardListBloc>()
                                                    .add(RemoveIndexEvent(
                                                        index: index));
                                              },
                                              child: const Text('삭제')),
                                        ]),
                                  ),
                                ),
                              );
                            },
                            // onMove: (detail){},
                            onMove: (detail) {
                              // 드래그 중일때 ,
                              // insertOldNumber 에 현재 index를 넣어주어야한다.
                              if (state.isDragging) {
                                context
                                    .read<CardListBloc>()
                                    .add(DragEvent(index: index));
                              }
                            },
                          ),
                        ));
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
