// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoListState _$TodoListStateFromJson(Map<String, dynamic> json) {
  return _TodoListState.fromJson(json);
}

/// @nodoc
mixin _$TodoListState {
  bool get isDragging => throw _privateConstructorUsedError;
  int get dragIndex => throw _privateConstructorUsedError;
  String get dragTodo => throw _privateConstructorUsedError;
  List<Todo> get todoList => throw _privateConstructorUsedError;
  List<Todo> get searchList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoListStateCopyWith<TodoListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListStateCopyWith<$Res> {
  factory $TodoListStateCopyWith(
          TodoListState value, $Res Function(TodoListState) then) =
      _$TodoListStateCopyWithImpl<$Res, TodoListState>;
  @useResult
  $Res call(
      {bool isDragging,
      int dragIndex,
      String dragTodo,
      List<Todo> todoList,
      List<Todo> searchList});
}

/// @nodoc
class _$TodoListStateCopyWithImpl<$Res, $Val extends TodoListState>
    implements $TodoListStateCopyWith<$Res> {
  _$TodoListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDragging = null,
    Object? dragIndex = null,
    Object? dragTodo = null,
    Object? todoList = null,
    Object? searchList = null,
  }) {
    return _then(_value.copyWith(
      isDragging: null == isDragging
          ? _value.isDragging
          : isDragging // ignore: cast_nullable_to_non_nullable
              as bool,
      dragIndex: null == dragIndex
          ? _value.dragIndex
          : dragIndex // ignore: cast_nullable_to_non_nullable
              as int,
      dragTodo: null == dragTodo
          ? _value.dragTodo
          : dragTodo // ignore: cast_nullable_to_non_nullable
              as String,
      todoList: null == todoList
          ? _value.todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      searchList: null == searchList
          ? _value.searchList
          : searchList // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoListStateCopyWith<$Res>
    implements $TodoListStateCopyWith<$Res> {
  factory _$$_TodoListStateCopyWith(
          _$_TodoListState value, $Res Function(_$_TodoListState) then) =
      __$$_TodoListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isDragging,
      int dragIndex,
      String dragTodo,
      List<Todo> todoList,
      List<Todo> searchList});
}

/// @nodoc
class __$$_TodoListStateCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res, _$_TodoListState>
    implements _$$_TodoListStateCopyWith<$Res> {
  __$$_TodoListStateCopyWithImpl(
      _$_TodoListState _value, $Res Function(_$_TodoListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDragging = null,
    Object? dragIndex = null,
    Object? dragTodo = null,
    Object? todoList = null,
    Object? searchList = null,
  }) {
    return _then(_$_TodoListState(
      isDragging: null == isDragging
          ? _value.isDragging
          : isDragging // ignore: cast_nullable_to_non_nullable
              as bool,
      dragIndex: null == dragIndex
          ? _value.dragIndex
          : dragIndex // ignore: cast_nullable_to_non_nullable
              as int,
      dragTodo: null == dragTodo
          ? _value.dragTodo
          : dragTodo // ignore: cast_nullable_to_non_nullable
              as String,
      todoList: null == todoList
          ? _value._todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      searchList: null == searchList
          ? _value._searchList
          : searchList // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoListState implements _TodoListState {
  _$_TodoListState(
      {required this.isDragging,
      required this.dragIndex,
      required this.dragTodo,
      required final List<Todo> todoList,
      required final List<Todo> searchList})
      : _todoList = todoList,
        _searchList = searchList;

  factory _$_TodoListState.fromJson(Map<String, dynamic> json) =>
      _$$_TodoListStateFromJson(json);

  @override
  final bool isDragging;
  @override
  final int dragIndex;
  @override
  final String dragTodo;
  final List<Todo> _todoList;
  @override
  List<Todo> get todoList {
    if (_todoList is EqualUnmodifiableListView) return _todoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todoList);
  }

  final List<Todo> _searchList;
  @override
  List<Todo> get searchList {
    if (_searchList is EqualUnmodifiableListView) return _searchList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchList);
  }

  @override
  String toString() {
    return 'TodoListState(isDragging: $isDragging, dragIndex: $dragIndex, dragTodo: $dragTodo, todoList: $todoList, searchList: $searchList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoListState &&
            (identical(other.isDragging, isDragging) ||
                other.isDragging == isDragging) &&
            (identical(other.dragIndex, dragIndex) ||
                other.dragIndex == dragIndex) &&
            (identical(other.dragTodo, dragTodo) ||
                other.dragTodo == dragTodo) &&
            const DeepCollectionEquality().equals(other._todoList, _todoList) &&
            const DeepCollectionEquality()
                .equals(other._searchList, _searchList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isDragging,
      dragIndex,
      dragTodo,
      const DeepCollectionEquality().hash(_todoList),
      const DeepCollectionEquality().hash(_searchList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoListStateCopyWith<_$_TodoListState> get copyWith =>
      __$$_TodoListStateCopyWithImpl<_$_TodoListState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoListStateToJson(
      this,
    );
  }
}

abstract class _TodoListState implements TodoListState {
  factory _TodoListState(
      {required final bool isDragging,
      required final int dragIndex,
      required final String dragTodo,
      required final List<Todo> todoList,
      required final List<Todo> searchList}) = _$_TodoListState;

  factory _TodoListState.fromJson(Map<String, dynamic> json) =
      _$_TodoListState.fromJson;

  @override
  bool get isDragging;
  @override
  int get dragIndex;
  @override
  String get dragTodo;
  @override
  List<Todo> get todoList;
  @override
  List<Todo> get searchList;
  @override
  @JsonKey(ignore: true)
  _$$_TodoListStateCopyWith<_$_TodoListState> get copyWith =>
      throw _privateConstructorUsedError;
}
