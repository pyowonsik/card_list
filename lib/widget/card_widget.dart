import 'package:card_list/bloc/card_list_bloc.dart';
import 'package:card_list/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/card_list_event.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;
  const CardWidget({super.key, required this.card});

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
                value: card.isChecked,
                onChanged: (value) {
                  context
                      .read<CardListBloc>()
                      .add(CheckCardEvent(time: card.time));
                }),
            Text(
              card.card,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<CardListBloc>()
                      .add(RemoveCardEvent(time: card.time));
                },
                child: const Text('삭제')),
          ]),
        ),
      ),
    );
  }
}
