import 'package:bloc/bloc.dart';
import 'package:card_list/bloc/card_list_state.dart';
import 'package:card_list/bloc/card_list_event.dart';

class CardListBloc extends Bloc<CardListEvent, CardListState> {
  CardListBloc()
      : super(const CardListState(
            isDragging: false,
            dragIndex: 0,
            dragTodo: '',
            todos: [],
            checked: [],
            todoList: [],
            checkedList: [],
            notCheckedList: [],
            notTodoList: [],
            todoModel: [])) {
    on<AddTodoEvent>(
      (AddTodoEvent event, emit) {
        return emit(state.copyWith(
          todos: [...state.todos, event.todo],
          checked: [...state.checked, false],
        ));
      },
    );

    on<RemoveTodoEvent>(
      (RemoveTodoEvent event, emit) {
        return emit(
          state.copyWith(todos: List.from(state.todos)..removeAt(event.index)),
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
      List<bool> copychecked = [...state.checked];

      List<bool> Cchecked = [];
      List<String> Ctodo = [];

      List<bool> Nchecked = [];
      List<String> Ntodo = [];

      (copychecked[event.index])
          ? copychecked[event.index] = false
          : copychecked[event.index] = true;

      emit(state.copyWith(
        checked: copychecked,
      ));

      for (var i = 0; i < state.checked.length; i++) {
        if (state.checked[i] == true) {
          Cchecked.add(state.checked[i]);
          Ctodo.add(state.todos[i]);
        }

        if (state.checked[i] == false) {
          Nchecked.add(state.checked[i]);
          Ntodo.add(state.todos[i]);
        }
      }

      return emit(state.copyWith(
          todoList: Ctodo,
          checkedList: Cchecked,
          notCheckedList: Nchecked,
          notTodoList: Ntodo));
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
        List<String> copyTodos = [...state.todos];
        List<bool> copychecked = [...state.checked];

        if (isDragDown(event.index)) {
          copyTodos.insert(event.index, copyTodos.removeAt(event.index - 1));
          copychecked.insert(
              event.index, copychecked.removeAt(event.index - 1));
          return emit(
            state.copyWith(
                dragIndex: state.dragIndex + 1,
                todos: copyTodos,
                checked: copychecked),
          );
        }

        if (isDragUp(event.index)) {
          copyTodos.insert(event.index, copyTodos.removeAt(event.index + 1));
          copychecked.insert(
              event.index, copychecked.removeAt(event.index + 1));

          return emit(
            state.copyWith(
                dragIndex: state.dragIndex - 1,
                todos: copyTodos,
                checked: copychecked),
          );
        }
      },
    );
  }

  bool isDragDown(int index) => (state.dragIndex < index) ? true : false;
  bool isDragUp(int index) => (state.dragIndex > index) ? true : false;

  List<bool> findCheckTrue(List<bool> checked) {
    List<bool> result = [];
    for (var i = 0; i < state.checked.length; i++) {
      if (state.checked[i] == true) {
        result.add(state.checked[i]);
      }
    }
    return result;
  }

  List<String> findCheckTodo(List<bool> checked) {
    List<String> result = [];
    for (var i = 0; i < state.checked.length; i++) {
      if (state.checked[i] == true) {
        result.add(state.todos[i]);
      }
    }
    return result;
  }
}
