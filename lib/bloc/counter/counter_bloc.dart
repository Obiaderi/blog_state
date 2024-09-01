import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<IncrementCounter>(_onIncrementCounter);
    on<DecrementCounter>(_onDecrementCounter);
  }

  void _onIncrementCounter(IncrementCounter event, Emitter<CounterState> emit) {
    emit(UpdateCounter(state.count + 1));
  }

  void _onDecrementCounter(DecrementCounter event, Emitter<CounterState> emit) {
    emit(UpdateCounter(state.count - 1));
  }
}
