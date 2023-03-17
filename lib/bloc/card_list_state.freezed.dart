// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardListState _$CardListStateFromJson(Map<String, dynamic> json) {
  return _CardListState.fromJson(json);
}

/// @nodoc
mixin _$CardListState {
  bool get isDragging => throw _privateConstructorUsedError;
  int get dragIndex => throw _privateConstructorUsedError;
  String get dragTodo => throw _privateConstructorUsedError;
  List<CardModel> get cardList => throw _privateConstructorUsedError;
  List<CardModel> get searchList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardListStateCopyWith<CardListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardListStateCopyWith<$Res> {
  factory $CardListStateCopyWith(
          CardListState value, $Res Function(CardListState) then) =
      _$CardListStateCopyWithImpl<$Res, CardListState>;
  @useResult
  $Res call(
      {bool isDragging,
      int dragIndex,
      String dragTodo,
      List<CardModel> cardList,
      List<CardModel> searchList});
}

/// @nodoc
class _$CardListStateCopyWithImpl<$Res, $Val extends CardListState>
    implements $CardListStateCopyWith<$Res> {
  _$CardListStateCopyWithImpl(this._value, this._then);

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
    Object? cardList = null,
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
      cardList: null == cardList
          ? _value.cardList
          : cardList // ignore: cast_nullable_to_non_nullable
              as List<CardModel>,
      searchList: null == searchList
          ? _value.searchList
          : searchList // ignore: cast_nullable_to_non_nullable
              as List<CardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardListStateCopyWith<$Res>
    implements $CardListStateCopyWith<$Res> {
  factory _$$_CardListStateCopyWith(
          _$_CardListState value, $Res Function(_$_CardListState) then) =
      __$$_CardListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isDragging,
      int dragIndex,
      String dragTodo,
      List<CardModel> cardList,
      List<CardModel> searchList});
}

/// @nodoc
class __$$_CardListStateCopyWithImpl<$Res>
    extends _$CardListStateCopyWithImpl<$Res, _$_CardListState>
    implements _$$_CardListStateCopyWith<$Res> {
  __$$_CardListStateCopyWithImpl(
      _$_CardListState _value, $Res Function(_$_CardListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDragging = null,
    Object? dragIndex = null,
    Object? dragTodo = null,
    Object? cardList = null,
    Object? searchList = null,
  }) {
    return _then(_$_CardListState(
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
      cardList: null == cardList
          ? _value._cardList
          : cardList // ignore: cast_nullable_to_non_nullable
              as List<CardModel>,
      searchList: null == searchList
          ? _value._searchList
          : searchList // ignore: cast_nullable_to_non_nullable
              as List<CardModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardListState implements _CardListState {
  _$_CardListState(
      {required this.isDragging,
      required this.dragIndex,
      required this.dragTodo,
      required final List<CardModel> cardList,
      required final List<CardModel> searchList})
      : _cardList = cardList,
        _searchList = searchList;

  factory _$_CardListState.fromJson(Map<String, dynamic> json) =>
      _$$_CardListStateFromJson(json);

  @override
  final bool isDragging;
  @override
  final int dragIndex;
  @override
  final String dragTodo;
  final List<CardModel> _cardList;
  @override
  List<CardModel> get cardList {
    if (_cardList is EqualUnmodifiableListView) return _cardList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cardList);
  }

  final List<CardModel> _searchList;
  @override
  List<CardModel> get searchList {
    if (_searchList is EqualUnmodifiableListView) return _searchList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchList);
  }

  @override
  String toString() {
    return 'CardListState(isDragging: $isDragging, dragIndex: $dragIndex, dragTodo: $dragTodo, cardList: $cardList, searchList: $searchList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardListState &&
            (identical(other.isDragging, isDragging) ||
                other.isDragging == isDragging) &&
            (identical(other.dragIndex, dragIndex) ||
                other.dragIndex == dragIndex) &&
            (identical(other.dragTodo, dragTodo) ||
                other.dragTodo == dragTodo) &&
            const DeepCollectionEquality().equals(other._cardList, _cardList) &&
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
      const DeepCollectionEquality().hash(_cardList),
      const DeepCollectionEquality().hash(_searchList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardListStateCopyWith<_$_CardListState> get copyWith =>
      __$$_CardListStateCopyWithImpl<_$_CardListState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardListStateToJson(
      this,
    );
  }
}

abstract class _CardListState implements CardListState {
  factory _CardListState(
      {required final bool isDragging,
      required final int dragIndex,
      required final String dragTodo,
      required final List<CardModel> cardList,
      required final List<CardModel> searchList}) = _$_CardListState;

  factory _CardListState.fromJson(Map<String, dynamic> json) =
      _$_CardListState.fromJson;

  @override
  bool get isDragging;
  @override
  int get dragIndex;
  @override
  String get dragTodo;
  @override
  List<CardModel> get cardList;
  @override
  List<CardModel> get searchList;
  @override
  @JsonKey(ignore: true)
  _$$_CardListStateCopyWith<_$_CardListState> get copyWith =>
      throw _privateConstructorUsedError;
}
