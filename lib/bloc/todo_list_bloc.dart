import 'package:bloc/bloc.dart';
import 'package:card_list/bloc/todo_list_event.dart';
import 'package:card_list/bloc/todo_list_state.dart';

import '../model/todo.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc()
      : super(TodoListState(
            isDragging: false,
            dragIndex: 0,
            dragTodo: '',
            todoList: [],
            searchList: [])) {
    on<AddTodoEvent>(
      (AddTodoEvent event, emit) {
        DateTime time = DateTime.now();
        List<Todo> currentTodo = [
          ...state.todoList,
          Todo(todo: event.todo, isChecked: false, time: time),
        ];

        return emit(state.copyWith(
          todoList: currentTodo,
        ));
      },
    );
    on<RemoveTodoEvent>(
      (RemoveTodoEvent event, emit) {
        return emit(
          state.copyWith(
            todoList: List.from(state.todoList)
              ..removeWhere((e) => e.time == event.time),
          ),
        );
      },
    );

    on<ChangeTodoNameEvent>(
      (ChangeTodoNameEvent event, emit) {
        List<Todo> currentTodo = [...state.todoList];

        int index = state.todoList.indexWhere((e) => e.time == event.time);
        currentTodo[index] = Todo(
            todo: event.todo,
            isChecked: state.todoList[index].isChecked,
            time: state.todoList[index].time);

        return emit(state.copyWith(todoList: currentTodo));
      },
    );

    on<CheckTodoEvent>((CheckTodoEvent event, emit) {
      List<Todo> currentTodo = [...state.todoList];
      int index = state.todoList.indexWhere((e) => e.time == event.time);

      (currentTodo[index].isChecked == true)
          ? currentTodo[index] = Todo(
              todo: state.todoList[index].todo,
              isChecked: false,
              time: state.todoList[index].time)
          : currentTodo[index] = Todo(
              todo: state.todoList[index].todo,
              isChecked: true,
              time: state.todoList[index].time);

      return emit(state.copyWith(todoList: currentTodo));
    });

    on<SearchTodoEvent>(
      (SearchTodoEvent event, emit) {
        return emit(state.copyWith(searchList: [
          ...event.todo.where((e) => e.todo.contains(event.todoName)).toList()
        ]));
      },
    );

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
