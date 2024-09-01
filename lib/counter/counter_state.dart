part of 'counter_cubit.dart';

sealed class CounterCubitState extends Equatable {
  final int count;
  const CounterCubitState(this.count);

  @override
  List<Object> get props => [count];
}

final class CounterInitial extends CounterCubitState {
  const CounterInitial(super.count);
}
