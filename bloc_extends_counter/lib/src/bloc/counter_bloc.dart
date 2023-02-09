import 'package:bloc/bloc.dart';
import 'package:bloc_extends_counter/src/bloc/counter_event.dart';
import 'package:bloc_extends_counter/src/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitState()) {
    on<IncreaseEvent>(_increase);
    on<DecreaseEvent>(_decrease);
    on<ZeroEvent>(_zero);
    on<ChangeEvent>(_change);
  }

  _increase(CounterEvent event, emit) async {
    emit(CounterChangeState(state.count + 1));
  }

  _decrease(CounterEvent event, emit) async {
    emit(CounterChangeState(state.count - 1));
  }

  _zero(CounterEvent event, emit) async {
    emit(CounterInitState());
  }


  // changeEvent event에만 num가 있으므로 event를 ChangeEvent로 받아줘야함
  _change(ChangeEvent event, emit) async {
    emit(CounterChangeState(event.num));
  }
}
