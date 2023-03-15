import 'package:bloc/bloc.dart';
import 'package:card_list/bloc/card_list_state.dart';
import 'package:card_list/bloc/card_list_event.dart';
import 'package:card_list/todo/todo.dart';

// id값을 따로 텍스트로 받아보자 , 지금 id값이랑 todo를 같이 쓰기 때문

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
          Todo(id: event.todo, todo: event.todo, isChecked: false)
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
            todoList: List.from(state.todoList)
              ..removeWhere((e) => e.id == event.id),
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
        int idx = state.todoList.indexWhere((e) => e.id == event.id);
        currentTodo[idx] = Todo(
            id: event.todo,
            todo: event.todo,
            isChecked: state.todoList[idx].isChecked);
        emit(state.copyWith(todoList: currentTodo));
        return emit(state.copyWith(
            checkedTodoList: getCheckedTodoList(currentTodo),
            unCheckedTodoList: getUnCheckedTodoList(currentTodo)));
      },
    );

    on<CheckTodoEvent>((CheckTodoEvent event, emit) {
      List<Todo> currentTodo = [...state.todoList];

      int idx = state.todoList.indexWhere((e) => e.id == event.id);

      (currentTodo[idx].isChecked == true)
          ? currentTodo[idx] = Todo(
              id: state.todoList[idx].id,
              todo: state.todoList[idx].todo,
              isChecked: false)
          : currentTodo[idx] = Todo(
              id: state.todoList[idx].id,
              todo: state.todoList[idx].todo,
              isChecked: true);

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
