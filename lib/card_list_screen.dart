import 'package:card_list/screen/List_screen.dart';
import 'package:card_list/screen/check_list_screen.dart';
import 'package:card_list/screen/un_check_list_screen.dart';
import 'package:flutter/material.dart';

// 투두리스트 처럼 체크 박스를 추가해주세요
// 그리고 상단에 탭을 둬서 체크한 것만
// 화면에 표시, 전체 표시, 체크 되지 않은 것만 표시 3가지로 화면을 나타낼 수 있도록 변경해주세요.

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
              CheckListScreen(),
              UnCheckListScreen()
            ]),
          )),
    );
  }
}
