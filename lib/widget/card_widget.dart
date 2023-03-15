import 'package:card_list/bloc/card_list_bloc.dart';
import 'package:card_list/bloc/card_list_state.dart';
import 'package:card_list/todo/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/card_list_event.dart';

class CardWidget extends StatelessWidget {
  final int index;
  final CardListState state;
  final String isChecked;
  const CardWidget(
      {super.key,
      required this.index,
      required this.state,
      required this.isChecked});

  @override
  Widget build(BuildContext context) {
    List<CardModel>? cardListType;
    if (isChecked == 'all') {
      cardListType = state.cardList;
    }
    if (isChecked == 'check') {
      cardListType = state.cardList.where((e) => e.isChecked == true).toList();
    }
    if (isChecked == 'uncheck') {
      cardListType = state.cardList.where((e) => e.isChecked == false).toList();
    }

    return SizedBox(
      height: 50,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Checkbox(
                value: cardListType![index].isChecked,
                onChanged: (value) {
                  context
                      .read<CardListBloc>()
                      .add(CheckCardEvent(time: cardListType![index].time));
                }),
            Text(
              cardListType[index].todo,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<CardListBloc>()
                      .add(RemoveCardEvent(time: cardListType![index].time));
                },
                child: const Text('삭제')),
          ]),
        ),
      ),
    );
  }
}
