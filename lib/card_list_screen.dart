import 'package:card_list/screen/List_screen.dart';
import 'package:card_list/screen/check_list_screen.dart';
import 'package:flutter/material.dart';

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            body: const TabBarView(children: [
              ListScreen(),
              CheckListScreen(isChecked: true),
              CheckListScreen(isChecked: false),
            ]),
          )),
    );
  }
}
