import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:card_list/card_list_bloc/card_list_event.dart';
import 'package:card_list/card_list_bloc/card_list_state.dart';

class CardListBloc extends Bloc<CardListEvent, CardListState> {
  CardListBloc()
      : super(const CardListState(
            numbers: [],
            isDragging: false,
            dragNumber: 0,
            dragIndex: 0,
            todos: [])) {
    Random randomSeed = Random();

    on<AddCardNumberEvent>(
      (AddCardNumberEvent event, emit) {
        List<int> copyNumbers = [...state.numbers];
        copyNumbers[event.index]++;
        return emit(state.copyWith(numbers: copyNumbers));
      },
    );

    on<AddCardEvent>(
      (AddCardEvent event, emit) {
        return emit(
          state.copyWith(
              numbers: [...state.numbers, randomSeed.nextInt(100) + 1]),
        );
      },
    );

    on<RemoveIndexEvent>(
      (RemoveIndexEvent event, emit) {
        return emit(
          state.copyWith(
            numbers: List.from(state.numbers)..removeAt(event.index),
          ),
        );
      },
    );

    on<AddTodoEvent>(
      (AddTodoEvent event, emit) {
        // print(event.todo);
        List<String> copyTodos = [...state.todos, event.todo];
        // return emit(
        //   state.copyWith(
        //     todos: List.from(state.todos)..add(event.todo),
        //   ),
        // );
        return emit(state.copyWith(todos: copyTodos));
      },
    );

    on<DragStartEvent>(
      (DragStartEvent event, emit) {
        return emit(
          state.copyWith(
              dragNumber: state.numbers[event.index],
              dragIndex: event.index,
              isDragging: true),
        );
      },
    );

    on<DragEndEvent>(
      (DragEndEvent event, emit) =>
          emit(state.copyWith(isDragging: !state.isDragging)),
    );

    on<DragEvent>(
      (DragEvent event, emit) {
        List<int> copyNumbers = [...state.numbers];

        if (isDragDown(event.index)) {
          copyNumbers.insert(
              event.index, copyNumbers.removeAt(event.index - 1));
          return emit(
            state.copyWith(
                dragIndex: state.dragIndex + 1, numbers: copyNumbers),
          );
        }

        if (isDragUp(event.index)) {
          copyNumbers.insert(
              event.index, copyNumbers.removeAt(event.index + 1));
          return emit(
            state.copyWith(
                dragIndex: state.dragIndex - 1, numbers: copyNumbers),
          );
        }
      },
    );
  }
  bool isDragDown(int index) => (state.dragIndex < index) ? true : false;
  bool isDragUp(int index) => (state.dragIndex > index) ? true : false;
}
