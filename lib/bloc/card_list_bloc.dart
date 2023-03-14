import 'package:bloc/bloc.dart';
import 'package:card_list/bloc/card_list_state.dart';
import 'package:card_list/bloc/card_list_event.dart';

class CardListBloc extends Bloc<CardListEvent, CardListState> {
  CardListBloc()
      : super(const CardListState(
            isDragging: false,
            dragIndex: 0,
            todos: [],
            dragTodo: '',
            checked: [],
            todoList: [],
            checkedList: [])) {
    on<AddTodoEvent>(
      (AddTodoEvent event, emit) {
        return emit(state.copyWith(
          todos: [...state.todos, event.todo],
          checked: [...state.checked, false],
          todoList: [...state.todos, event.todo],
          checkedList: [...state.checked, false],
        ));
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
      List<bool> copychecked = [...state.checked];
      (copychecked[event.index])
          ? copychecked[event.index] = false
          : copychecked[event.index] = true;
      return emit(
          state.copyWith(checked: copychecked, checkedList: copychecked));
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

    on<AllListEvent>(
      (AllListEvent event, emit) {
        print('${state.checkedList} , ${state.todoList}');
        return emit(
            state.copyWith(todos: state.todoList, checked: state.checkedList));
      },
    );

    on<CheckedListEvent>(
      (CheckedListEvent event, emit) {
        List<bool> copychecked = [];
        List<String> copyTodos = [];

        emit(state.copyWith(checked: state.checkedList, todos: state.todoList));
        for (var i = 0; i < state.checked.length; i++) {
          if (state.checked[i] == true) {
            copychecked.add(state.checked[i]);
            copyTodos.add(state.todos[i]);
          }
        }
        print('Checked : ${copychecked} , ${copyTodos}');
        return emit(state.copyWith(checked: copychecked, todos: copyTodos));
      },
    );

    on<OtherListEvent>(
      (OtherListEvent event, emit) {
        List<bool> copychecked = [];
        List<String> copyTodos = [];

        emit(state.copyWith(checked: state.checkedList, todos: state.todoList));
        for (var i = 0; i < state.checked.length; i++) {
          if (state.checked[i] == false) {
            copychecked.add(state.checked[i]);
            copyTodos.add(state.todos[i]);
          }
        }
        print('Others : ${copychecked} , ${copyTodos}');
        return emit(state.copyWith(checked: copychecked, todos: copyTodos));
      },
    );
  }

  bool isDragDown(int index) => (state.dragIndex < index) ? true : false;
  bool isDragUp(int index) => (state.dragIndex > index) ? true : false;
}
