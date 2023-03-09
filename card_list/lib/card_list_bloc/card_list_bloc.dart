import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:card_list/card_list_bloc/card_list_event.dart';
import 'package:card_list/card_list_bloc/card_list_state.dart';

class CardListBloc extends Bloc<CardListEvent, CardListState> {
  CardListBloc()
      : super(const CardListState(
            numbers: [], isDragging: false, dragNumber: 0, dragIndex: 0)) {
    Random randomSeed = Random();

    on<AddNumberEvent>(
      (event, emit) {
        List<int> copyNumbers = [...state.numbers];
        copyNumbers[event.index]++;
        return emit(state.copyWith(numbers: copyNumbers));
      },
    );

    on<AddIndexEvent>(
      (AddIndexEvent event, emit) {
        return emit(
          state.copyWith(
              numbers: [...state.numbers, randomSeed.nextInt(100) + 1]),
        );
      },
    );

    on<RemoveIndexEvent>(
      (RemoveIndexEvent event, emit) {
        // return emit(
        //   state.copyWith(
        //     numbers: state.numbers
        //         .whereIndexed((index, element) => index != event.index)
        //         .toList(),
        //   ),
        // );

        return emit(
          state.copyWith(
            numbers: List.from(state.numbers)..removeAt(event.index),
          ),
        );
      },
    );

    on<DragStartEvent>(
      (DragStartEvent event, emit) {
        return emit(
          state.copyWith(
              dragNumber: state.numbers[event.index],
              dragIndex: event.index,
              isDragging: !state.isDragging),
        );
      },
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

  bool isDragDown(int index) {
    if (state.dragIndex < index) return true;
    return false;
  }

  bool isDragUp(int index) {
    if (state.dragIndex > index) return true;
    return false;
  }
}
