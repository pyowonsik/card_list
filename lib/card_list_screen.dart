import 'package:card_list/screen/List_screen.dart';
import 'package:card_list/screen/check_list_screen.dart';
import 'package:card_list/todo/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/card_list_bloc.dart';
import 'bloc/card_list_state.dart';

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                body: TabBarView(children: [
                  ListScreen(cardList: state.cardList),
                  CheckListScreen(
                      cardList: state.cardList
                          .where((e) => e.isChecked == true)
                          .toList()),
                  CheckListScreen(
                      cardList: state.cardList
                          .where((e) => e.isChecked == false)
                          .toList()),
                ]),
              )),
        );
      },
    );
  }
}
