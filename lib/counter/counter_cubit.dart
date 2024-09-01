import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(const CounterInitial(0));

  void increment() => emit(CounterInitial(state.count + 1));
  void decrement() => emit(CounterInitial(state.count - 1));
}
