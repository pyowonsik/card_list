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
            todoModel: [],
            checkedModel: [],
            unCheckedModel: [])) {
    on<AddTodoEvent>(
      (AddTodoEvent event, emit) {
        Todo newTodo = Todo(todo: event.todo, isChecked: false);
        List<Todo> currentTodo = [...state.todoModel, newTodo];
        List<Todo> checkedTodo = [...state.checkedModel];
        List<Todo> unCheckedTodo = [...state.checkedModel];

        checkedTodo = currentTodo.where((e) => e.isChecked == true).toList();
        unCheckedTodo = currentTodo.where((e) => e.isChecked == false).toList();

        return emit(state.copyWith(
            todoModel: currentTodo,
            checkedModel: checkedTodo,
            unCheckedModel: unCheckedTodo));
      },
    );

    on<RemoveTodoEvent>(
      (RemoveTodoEvent event, emit) {
        return emit(state.copyWith(
            todoModel: List.from(state.todoModel)..removeAt(event.index)));
      },
    );

    on<ChangeTodoEvent>(
      (ChangeTodoEvent event, emit) {
        List<Todo> currentTodo = [...state.todoModel];

        // Todo 클래스 사용
        currentTodo[event.index] = Todo(
            todo: event.todo,
            isChecked: state.todoModel[event.index].isChecked);
        return emit(state.copyWith(todoModel: currentTodo));
      },
    );

    // Todo 클래스 사용
    on<CheckTodoEvent>((CheckTodoEvent event, emit) {
      List<Todo> currentTodo = [...state.todoModel];
      List<Todo> checkedTodo = [...state.checkedModel];
      List<Todo> unCheckedTodo = [...state.checkedModel];

      (currentTodo[event.index].isChecked == true)
          ? currentTodo[event.index] =
              Todo(todo: state.todoModel[event.index].todo, isChecked: false)
          : currentTodo[event.index] =
              Todo(todo: state.todoModel[event.index].todo, isChecked: true);

      checkedTodo = currentTodo.where((e) => e.isChecked == true).toList();
      unCheckedTodo = currentTodo.where((e) => e.isChecked == false).toList();

      return emit(state.copyWith(
          todoModel: currentTodo,
          checkedModel: checkedTodo,
          unCheckedModel: unCheckedTodo));
    });

    on<DragStartEvent>(
      (DragStartEvent event, emit) {
        return emit(
          state.copyWith(
              dragTodo: state.todoModel[event.index].todo,
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
        List<Todo> currentTodo = [...state.todoModel];

        if (isDragDown(event.index)) {
          currentTodo.insert(
              event.index, currentTodo.removeAt(event.index - 1));
          return emit(
            state.copyWith(
                dragIndex: state.dragIndex + 1, todoModel: currentTodo),
          );
        }

        if (isDragUp(event.index)) {
          currentTodo.insert(
              event.index, currentTodo.removeAt(event.index + 1));

          return emit(
            state.copyWith(
                dragIndex: state.dragIndex - 1, todoModel: currentTodo),
          );
        }
      },
    );
  }

  bool isDragDown(int index) => (state.dragIndex < index) ? true : false;
  bool isDragUp(int index) => (state.dragIndex > index) ? true : false;
}
