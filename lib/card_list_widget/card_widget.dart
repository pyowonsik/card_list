import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../card_list_bloc/card_list_bloc.dart';
import '../card_list_bloc/card_list_event.dart';
import '../card_list_bloc/card_list_state.dart';

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
            Text(
              // state.numbers[index].toString(),
              state.todos[index],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<CardListBloc>()
                      .add(RemoveIndexEvent(index: index));
                },
                child: const Text('삭제')),
          ]),
        ),
      ),
    );
  }
}
