import 'package:bloc/bloc.dart';
import 'package:card_list/bloc/card_list_state.dart';
import 'package:card_list/bloc/card_list_event.dart';
import 'package:card_list/todo/card_model.dart';

class CardListBloc extends Bloc<CardListEvent, CardListState> {
  CardListBloc()
      : super(const CardListState(
          isDragging: false,
          dragIndex: 0,
          dragTodo: '',
          cardList: [],
        )) {
    on<AddCardEvent>(
      (AddCardEvent event, emit) {
        DateTime time = DateTime.now();
        List<CardModel> currentTodo = [
          ...state.cardList,
          CardModel(todo: event.card, isChecked: false, time: time),
        ];

        return emit(state.copyWith(
          cardList: currentTodo,
        ));
      },
    );
    on<RemoveCardEvent>(
      (RemoveCardEvent event, emit) {
        emit(
          state.copyWith(
            cardList: List.from(state.cardList)
              ..removeWhere((e) => e.time == event.time),
          ),
        );

        return emit(state.copyWith());
      },
    );

    on<ChangeCardEvent>(
      (ChangeCardEvent event, emit) {
        List<CardModel> currentTodo = [...state.cardList];

        int index = state.cardList.indexWhere((e) => e.time == event.time);
        currentTodo[index] = CardModel(
            todo: event.card,
            isChecked: state.cardList[index].isChecked,
            time: state.cardList[index].time);

        emit(state.copyWith(cardList: currentTodo));
        return emit(state.copyWith());
      },
    );

    on<CheckCardEvent>((CheckCardEvent event, emit) {
      List<CardModel> currentTodo = [...state.cardList];
      int index = state.cardList.indexWhere((e) => e.time == event.time);

      (currentTodo[index].isChecked == true)
          ? currentTodo[index] = CardModel(
              todo: state.cardList[index].todo,
              isChecked: false,
              time: state.cardList[index].time)
          : currentTodo[index] = CardModel(
              todo: state.cardList[index].todo,
              isChecked: true,
              time: state.cardList[index].time);

      return emit(state.copyWith(cardList: currentTodo));
    });

    on<DragStartEvent>(
      (DragStartEvent event, emit) {
        return emit(
          state.copyWith(
              dragTodo: state.cardList[event.index].todo,
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
        List<CardModel> currentTodo = [...state.cardList];

        if (isDragDown(event.index)) {
          currentTodo.insert(
              event.index, currentTodo.removeAt(event.index - 1));
          return emit(
            state.copyWith(
                dragIndex: state.dragIndex + 1, cardList: currentTodo),
          );
        }

        if (isDragUp(event.index)) {
          currentTodo.insert(
              event.index, currentTodo.removeAt(event.index + 1));
          return emit(
            state.copyWith(
                dragIndex: state.dragIndex - 1, cardList: currentTodo),
          );
        }
      },
    );
  }

  bool isDragDown(int index) => (state.dragIndex < index) ? true : false;
  bool isDragUp(int index) => (state.dragIndex > index) ? true : false;
}
