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
        List<Todo> currentTodo = [
          ...state.todoList,
          Todo(todo: event.todo, isChecked: false)
        ];

        return emit(state.copyWith(
            todoList: currentTodo,
            checkedTodoList: getCheckedTodoList(currentTodo),
            unCheckedTodoList: getUnCheckedTodoList(currentTodo)));
      },
    );

    on<RemoveTodoEvent>(
      (RemoveTodoEvent event, emit) {
        emit(
          state.copyWith(
            todoList: List.from(state.todoList)..removeAt(event.index),
          ),
        );

        return emit(state.copyWith(
            checkedTodoList: getCheckedTodoList([...state.todoList]),
            unCheckedTodoList: getUnCheckedTodoList([...state.todoList])));
      },
    );

    on<ChangeTodoEvent>(
      (ChangeTodoEvent event, emit) {
        List<Todo> currentTodo = [...state.todoList];

        currentTodo[event.index] = Todo(
            todo: event.todo, isChecked: state.todoList[event.index].isChecked);
        emit(state.copyWith(todoList: currentTodo));
        return emit(state.copyWith(
            checkedTodoList: getCheckedTodoList(currentTodo),
            unCheckedTodoList: getUnCheckedTodoList(currentTodo)));
      },
    );

    on<CheckTodoEvent>((CheckTodoEvent event, emit) {
      List<Todo> currentTodo = [...state.todoList];

      (currentTodo[event.index].isChecked == true)
          ? currentTodo[event.index] =
              Todo(todo: state.todoList[event.index].todo, isChecked: false)
          : currentTodo[event.index] =
              Todo(todo: state.todoList[event.index].todo, isChecked: true);

      return emit(state.copyWith(
          todoList: currentTodo,
          checkedTodoList: getCheckedTodoList(currentTodo),
          unCheckedTodoList: getUnCheckedTodoList(currentTodo)));
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
  List<Todo> getCheckedTodoList(List<Todo> currentTodo) =>
      currentTodo.where((e) => e.isChecked == true).toList();
  List<Todo> getUnCheckedTodoList(List<Todo> currentTodo) =>
      currentTodo.where((e) => e.isChecked == false).toList();
}
