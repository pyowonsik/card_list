import 'package:card_list/todo/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/card_list_bloc.dart';
import '../bloc/card_list_event.dart';
import '../bloc/card_list_state.dart';
import '../widget/card_widget.dart';

class CheckListScreen extends StatelessWidget {
  final bool isChecked;
  const CheckListScreen({super.key, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    CardListBloc cardListBloc = context.read<CardListBloc>();
    final todoController = TextEditingController();
    List<Todo>? todoListType;

    return BlocBuilder<CardListBloc, CardListState>(builder: (context, state) {
      (isChecked)
          ? todoListType = state.checkedCardList
          : todoListType = state.unCheckedCardList;
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
              itemCount: todoListType!.length,
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
                                    child: const Text("변경"),
                                    onPressed: () {
                                      cardListBloc.add(ChangeTodoEvent(
                                          id: todoListType![index].id,
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
                  child: (isChecked)
                      ? CardWidget(
                          index: index,
                          state: state,
                          listType: 'check',
                        )
                      : CardWidget(
                          index: index,
                          state: state,
                          listType: 'uncheck',
                        ),
                );
              },
            )),
          ],
        ),
      );
    });
  }
}
