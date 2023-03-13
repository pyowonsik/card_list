import 'package:bloc/bloc.dart';
import 'package:card_list/card_list_bloc/card_list_event.dart';
import 'package:card_list/card_list_bloc/card_list_state.dart';
import 'package:card_list/card_list_widget/card_widget.dart';

class CardListBloc extends Bloc<CardListEvent, CardListState> {
  CardListBloc()
      : super(const CardListState(
            isDragging: false,
            dragIndex: 0,
            todos: [],
            dragTodo: '',
            isChecked: [])) {
    on<AddTodoEvent>(
      (AddTodoEvent event, emit) {
        return emit(state.copyWith(
            todos: [...state.todos, event.todo],
            isChecked: [...state.isChecked, false]));
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

    on<CheckTodoEvent>((CheckTodoEvent event, emit) {
      print('${state.todos[event.index]} : ${state.isChecked[event.index]}');
      List<bool> copyIsChecked = [...state.isChecked];
      (copyIsChecked[event.index])
          ? copyIsChecked[event.index] = false
          : copyIsChecked[event.index] = true;
      return emit(state.copyWith(isChecked: copyIsChecked));
    });

    on<DragStartEvent>(
      (DragStartEvent event, emit) {
        return emit(
          state.copyWith(
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
        // List<Todos>
        List<String> copyTodos = [...state.todos];
        List<bool> copyIsChecked = [...state.isChecked];

        if (isDragDown(event.index)) {
          copyTodos.insert(event.index, copyTodos.removeAt(event.index - 1));
          copyIsChecked.insert(
              event.index, copyIsChecked.removeAt(event.index - 1));
          return emit(
            state.copyWith(
                dragIndex: state.dragIndex + 1,
                todos: copyTodos,
                isChecked: copyIsChecked),
          );
        }

        if (isDragUp(event.index)) {
          copyTodos.insert(event.index, copyTodos.removeAt(event.index + 1));
          copyIsChecked.insert(
              event.index, copyIsChecked.removeAt(event.index + 1));

          return emit(
            state.copyWith(
                dragIndex: state.dragIndex - 1,
                todos: copyTodos,
                isChecked: copyIsChecked),
          );
        }
      },
    );
  }
  bool isDragDown(int index) => (state.dragIndex < index) ? true : false;
  bool isDragUp(int index) => (state.dragIndex > index) ? true : false;
}
