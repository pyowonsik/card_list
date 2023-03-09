import 'package:card_list/card_list_bloc/card_list_bloc.dart';
import 'package:card_list/card_list_bloc/card_list_event.dart';
import 'package:card_list/card_list_bloc/card_list_state.dart';
import 'package:card_list/card_list_widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  context.read<CardListBloc>().add(AddCardEvent());
                },
                child: const Text('추가')),
            const SizedBox(height: 30),
            BlocBuilder<CardListBloc, CardListState>(
              builder: (context, state) {
                return Expanded(
                    child: ListView.builder(
                  itemCount: state.numbers.length,
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
                                maxWidth: MediaQuery.of(context).size.width),
                            child: CardWidget(index: index, state: state),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<CardListBloc>()
                                .add(AddCardNumberEvent(index: index));
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
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
