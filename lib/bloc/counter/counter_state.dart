part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  final int count;

  const CounterState(this.count);

  @override
  List<Object> get props => [count];
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class UpdateCounter extends CounterState {
  const UpdateCounter(int count) : super(count);
}
