import 'package:bloc/bloc.dart';
import 'package:card_list/bloc/card_list_state.dart';
import 'package:card_list/bloc/card_list_event.dart';
import 'package:card_list/todo/todo.dart';

// id로 시간값 넣기

class CardListBloc extends Bloc<CardListEvent, CardListState> {
  CardListBloc()
      : super(const CardListState(
            isDragging: false,
            dragIndex: 0,
            dragTodo: '',
            cardList: [],
            checkedCardList: [],
            unCheckedCardList: [])) {
    on<AddTodoEvent>(
      (AddTodoEvent event, emit) {
        DateTime time = DateTime.now();
        List<Todo> currentTodo = [
          ...state.cardList,
          Todo(todo: event.todo, isChecked: false, time: time),
        ];

        return emit(state.copyWith(
            cardList: currentTodo,
            checkedCardList: getCheckedTodoList(currentTodo),
            unCheckedCardList: getUnCheckedTodoList(currentTodo)));
      },
    );
    on<RemoveTodoEvent>(
      (RemoveTodoEvent event, emit) {
        emit(
          state.copyWith(
            cardList: List.from(state.cardList)
              ..removeWhere((e) => e.time == event.time),
          ),
        );

        return emit(state.copyWith(
            checkedCardList: getCheckedTodoList([...state.cardList]),
            unCheckedCardList: getUnCheckedTodoList([...state.cardList])));
      },
    );

    on<ChangeTodoEvent>(
      (ChangeTodoEvent event, emit) {
        List<Todo> currentTodo = [...state.cardList];

        int index = state.cardList.indexWhere((e) => e.time == event.time);
        currentTodo[index] = Todo(
            todo: event.todo,
            isChecked: state.cardList[index].isChecked,
            time: state.cardList[index].time);

        emit(state.copyWith(cardList: currentTodo));
        return emit(state.copyWith(
            checkedCardList: getCheckedTodoList(currentTodo),
            unCheckedCardList: getUnCheckedTodoList(currentTodo)));
      },
    );

    on<CheckTodoEvent>((CheckTodoEvent event, emit) {
      List<Todo> currentTodo = [...state.cardList];
      int index = state.cardList.indexWhere((e) => e.time == event.time);

      (currentTodo[index].isChecked == true)
          ? currentTodo[index] = Todo(
              todo: state.cardList[index].todo,
              isChecked: false,
              time: state.cardList[index].time)
          : currentTodo[index] = Todo(
              todo: state.cardList[index].todo,
              isChecked: true,
              time: state.cardList[index].time);

      return emit(state.copyWith(
          cardList: currentTodo,
          checkedCardList: getCheckedTodoList(currentTodo),
          unCheckedCardList: getUnCheckedTodoList(currentTodo)));
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
        List<Todo> currentTodo = [...state.cardList];

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
  List<Todo> getCheckedTodoList(List<Todo> currentTodo) =>
      currentTodo.where((e) => e.isChecked == true).toList();
  List<Todo> getUnCheckedTodoList(List<Todo> currentTodo) =>
      currentTodo.where((e) => e.isChecked == false).toList();
}
