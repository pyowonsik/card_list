import 'package:card_list/bloc/card_list_bloc.dart';
import 'package:card_list/bloc/card_list_state.dart';
import 'package:card_list/bloc/card_list_event.dart';
import 'package:card_list/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 투두리스트 처럼 체크 박스를 추가해주세요
// 그리고 상단에 탭을 둬서 체크한 것만
// 화면에 표시, 전체 표시, 체크 되지 않은 것만 표시 3가지로 화면을 나타낼 수 있도록 변경해주세요.

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  // late CardListBloc cardListBloc; // late로 선언

  // void addTodo(BuildContext context, CardListState state) {
  //   final todoController = TextEditingController();
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  //         title: const Text('Todo 입력 '),
  //         content: BlocBuilder<CardListBloc, CardListState>(
  //           bloc: cardListBloc, // showDialog에서 bloc 등록
  //           builder: (context, state) {
  //             return TextField(
  //               controller: todoController,
  //             );
  //           },
  //         ),
  //         actions: [
  //           ElevatedButton(
  //             child: const Text("추가"),
  //             onPressed: () {
  //               cardListBloc.add(AddTodoEvent(todo: todoController.text));
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    CardListBloc cardListBloc = context.read<CardListBloc>();
    // modal 에서 bloc 사용하기위해 bloc 등록 ,
    // modal 안에서 context를 showDialog를 사용하기 때문에,
    // 등록한 bloc을 사용하여 event를 발생시켜야함

    final todoController = TextEditingController();

    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            // appBar: AppBar(
            //   title: const Text('Todo List'),
            //   bottom: const TabBar(tabs: [
            //     Tab(text: 'all'),
            //     Tab(text: 'check'),
            //     Tab(text: 'others'),
            //   ]),
            // ),
            body:
                // const TabBarView(children: []),
                BlocBuilder<CardListBloc, CardListState>(
                    builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context.read<CardListBloc>().add(AllListEvent());
                            },
                            child: const Text('all')),
                        const SizedBox(width: 30),
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<CardListBloc>()
                                  .add(CheckedListEvent());
                            },
                            child: const Text('check')),
                        const SizedBox(width: 30),
                        ElevatedButton(
                            onPressed: () {}, child: const Text('other')),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          // addTodo(context, state);
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  title: const Text('Todo 입력 '),
                                  content:
                                      BlocBuilder<CardListBloc, CardListState>(
                                    bloc: cardListBloc, // showDialog에서 bloc 등록
                                    builder: (context, state) {
                                      return TextField(
                                        controller: todoController,
                                      );
                                    },
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      child: const Text("추가"),
                                      onPressed: () {
                                        cardListBloc.add(AddTodoEvent(
                                            todo: todoController.text));
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });

                          todoController.clear();
                        },
                        child: const Text('추가')),
                    const SizedBox(height: 30),
                    Expanded(
                        child: ListView.builder(
                      itemCount: state.todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Draggable(
                            data: index,
                            onDragStarted: () {
                              context
                                  .read<CardListBloc>()
                                  .add(DragStartEvent(index: index));
                            },
                            onDraggableCanceled: (_, __) {
                              context.read<CardListBloc>().add(DragEndEvent());
                            },
                            onDragCompleted: () {
                              context.read<CardListBloc>().add(DragEndEvent());
                            },
                            feedback: Material(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width),
                                child: CardWidget(index: index, state: state),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        title: const Text('변경할 Todo 입력 '),
                                        content: BlocBuilder<CardListBloc,
                                            CardListState>(
                                          bloc:
                                              cardListBloc, // showDialog에서 bloc 등록
                                          builder: (context, state) {
                                            return TextField(
                                              controller: todoController,
                                            );
                                          },
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            child: const Text("변경"),
                                            onPressed: () {
                                              cardListBloc.add(ChangeTodoEvent(
                                                  todo: todoController.text,
                                                  index: index));
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                                todoController.clear();
                              },
                              child: DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                ) {
                                  return CardWidget(index: index, state: state);
                                },
                                onMove: (detail) {
                                  if (state.isDragging) {
                                    context
                                        .read<CardListBloc>()
                                        .add(DragEvent(index: index));
                                  }
                                },
                              ),
                            ));
                      },
                    )),
                  ],
                ),
              );
            }),
          )),
    );
  }
}
