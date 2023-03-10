import 'package:bloc/bloc.dart';
import 'package:card_list/card_list_bloc/card_list_event.dart';
import 'package:card_list/card_list_bloc/card_list_state.dart';

class CardListBloc extends Bloc<CardListEvent, CardListState> {
  CardListBloc()
      : super(const CardListState(
            // numbers: [],
            isDragging: false,
            // dragNumber: 0,
            dragIndex: 0,
            todos: [],
            dragTodo: '')) {
    // Random randomSeed = Random();

    // on<AddCardNumberEvent>(
    //   (AddCardNumberEvent event, emit) {
    //     List<int> copyTodos
    // = [...state.numbers];
    //     copyTodos
    // [event.index]++;
    //     return emit(state.copyWith(numbers: copyTodos
    // ));
    //   },
    // );

    // on<AddCardEvent>(
    //   (AddCardEvent event, emit) {
    //     return emit(
    //       state.copyWith(
    //           numbers: [...state.numbers, randomSeed.nextInt(100) + 1]),
    //     );
    //   },
    // );

    on<AddTodoEvent>(
      (AddTodoEvent event, emit) {
        return emit(state.copyWith(todos: [...state.todos, event.todo]));
      },
    );

    on<RemoveTodoEvent>(
      (RemoveTodoEvent event, emit) {
        return emit(
          state.copyWith(
            todos: List.from(state.todos)..removeAt(event.index),
          ),
        );
      },
    );

    on<ChangeTodoEvent>(
      (ChangeTodoEvent event, emit) {
        List<String> copyTodos = [...state.todos];
        copyTodos[event.index] = event.todo;
        return emit(state.copyWith(todos: copyTodos));
      },
    );

    on<DragStartEvent>(
      (DragStartEvent event, emit) {
        return emit(
          state.copyWith(
              // dragNumber: state.numbers[event.index],
              dragTodo: state.todos[event.index],
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
        List<String> copyTodos = [...state.todos];

        if (isDragDown(event.index)) {
          copyTodos.insert(event.index, copyTodos.removeAt(event.index - 1));
          return emit(
            state.copyWith(dragIndex: state.dragIndex + 1, todos: copyTodos),
          );
        }

        if (isDragUp(event.index)) {
          copyTodos.insert(event.index, copyTodos.removeAt(event.index + 1));
          return emit(
            state.copyWith(dragIndex: state.dragIndex - 1, todos: copyTodos),
          );
        }
      },
    );
  }
  bool isDragDown(int index) => (state.dragIndex < index) ? true : false;
  bool isDragUp(int index) => (state.dragIndex > index) ? true : false;
}
