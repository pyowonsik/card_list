import 'package:bloc/bloc.dart';
import 'package:card_list/bloc/card_list_state.dart';
import 'package:card_list/bloc/card_list_event.dart';
import 'package:card_list/todo/todo.dart';

class CardListBloc extends Bloc<CardListEvent, CardListState> {
  CardListBloc()
      : super(const CardListState(
            isDragging: false,
            dragIndex: 0,
            dragTodo: '',
            todoList: [],
            checkedTodoList: [],
            unCheckedTodoList: [])) {
    on<AddTodoEvent>(
      (AddTodoEvent event, emit) {
        Todo newTodo = Todo(todo: event.todo, isChecked: false);
        List<Todo> currentTodo = [...state.todoList, newTodo];
        List<Todo> checkedTodo = [...state.checkedTodoList];
        List<Todo> unCheckedTodo = [...state.checkedTodoList];

        checkedTodo = currentTodo.where((e) => e.isChecked == true).toList();
        unCheckedTodo = currentTodo.where((e) => e.isChecked == false).toList();

        return emit(state.copyWith(
            todoList: currentTodo,
            checkedTodoList: checkedTodo,
            unCheckedTodoList: unCheckedTodo));
      },
    );

    on<RemoveTodoEvent>(
      (RemoveTodoEvent event, emit) {
        return emit(state.copyWith(
            todoList: List.from(state.todoList)..removeAt(event.index)));
      },
    );

    on<ChangeTodoEvent>(
      (ChangeTodoEvent event, emit) {
        List<Todo> currentTodo = [...state.todoList];

        currentTodo[event.index] = Todo(
            todo: event.todo, isChecked: state.todoList[event.index].isChecked);
        return emit(state.copyWith(todoList: currentTodo));
      },
    );

    on<CheckTodoEvent>((CheckTodoEvent event, emit) {
      List<Todo> currentTodo = [...state.todoList];
      List<Todo> checkedTodo = [...state.checkedTodoList];
      List<Todo> unCheckedTodo = [...state.checkedTodoList];

      (currentTodo[event.index].isChecked == true)
          ? currentTodo[event.index] =
              Todo(todo: state.todoList[event.index].todo, isChecked: false)
          : currentTodo[event.index] =
              Todo(todo: state.todoList[event.index].todo, isChecked: true);

      checkedTodo = currentTodo.where((e) => e.isChecked == true).toList();
      unCheckedTodo = currentTodo.where((e) => e.isChecked == false).toList();

      return emit(state.copyWith(
          todoList: currentTodo,
          checkedTodoList: checkedTodo,
          unCheckedTodoList: unCheckedTodo));
    });

    on<DragStartEvent>(
      (DragStartEvent event, emit) {
        return emit(
          state.copyWith(
              dragTodo: state.todoList[event.index].todo,
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
        List<Todo> currentTodo = [...state.todoList];

        if (isDragDown(event.index)) {
          currentTodo.insert(
              event.index, currentTodo.removeAt(event.index - 1));
          return emit(
            state.copyWith(
                dragIndex: state.dragIndex + 1, todoList: currentTodo),
          );
        }

        if (isDragUp(event.index)) {
          currentTodo.insert(
              event.index, currentTodo.removeAt(event.index + 1));

          return emit(
            state.copyWith(
                dragIndex: state.dragIndex - 1, todoList: currentTodo),
          );
        }
      },
    );
  }

  bool isDragDown(int index) => (state.dragIndex < index) ? true : false;
  bool isDragUp(int index) => (state.dragIndex > index) ? true : false;
}
