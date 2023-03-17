import 'package:card_list/bloc/card_list_event.dart';
import 'package:card_list/screen/List_screen.dart';
import 'package:card_list/screen/check_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/card_list_bloc.dart';
import 'bloc/card_list_state.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return BlocBuilder<CardListBloc, CardListState>(
      builder: (context, state) {
        return MaterialApp(
          home: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Todo List'),
                  bottom: const TabBar(tabs: [
                    Tab(text: 'all'),
                    Tab(text: 'check'),
                    Tab(text: 'uncheck'),
                  ]),
                ),
                body: Column(
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (val) {
                          context.read<CardListBloc>().add(
                                SearchCardEvent(
                                    cardName: val, cardModel: state.cardList),
                              );
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListScreen(
                              cardList: state.cardList
                                  .where((e) =>
                                      e.card.contains(searchController.text))
                                  .toList()),
                          CheckListScreen(
                              cardList: state.cardList
                                  .where((e) =>
                                      e.card.contains(searchController.text) &&
                                      e.isChecked == true)
                                  .toList()),
                          CheckListScreen(
                              cardList: state.cardList
                                  .where((e) =>
                                      e.card.contains(searchController.text) &&
                                      e.isChecked == false)
                                  .toList())
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
