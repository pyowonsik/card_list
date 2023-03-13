import 'package:card_list/bloc/card_list_bloc.dart';
import 'package:card_list/bloc/card_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/card_list_event.dart';

class CardWidget extends StatelessWidget {
  final int index;
  final CardListState state;
  const CardWidget({super.key, required this.index, required this.state});

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
                value: state.isChecked[index],
                onChanged: (value) {
                  context
                      .read<CardListBloc>()
                      .add(CheckTodoEvent(index: index));
                }),
            Text(
              state.todos[index],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<CardListBloc>()
                      .add(RemoveTodoEvent(index: index));
                },
                child: const Text('삭제')),
          ]),
        ),
      ),
    );
  }
}
