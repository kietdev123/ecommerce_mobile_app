import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<DecreaseCounter>(_mapDecreaseCounterEventToState);
    on<IncreaseCounter>(_mapIncreaseCounterEventToState);
  }

  void _mapDecreaseCounterEventToState(
      DecreaseCounter event, Emitter<CounterState> emit) async {
    // emit(state.copyWith(status: CounterStatus.loading));
    try {
      // state.decreaseCountValue();
      print(state.countValue);
      emit(
        state.copyWith(
          status: CounterStatus.success,
          countValue: state.countValue - 1,
        ),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: CounterStatus.error));
    }
  }

  void _mapIncreaseCounterEventToState(
      IncreaseCounter event, Emitter<CounterState> emit) async {
    // emit(state.copyWith(status: CounterStatus.loading));
    try {
      // state.increaseCountValue();
      emit(
        state.copyWith(
          status: CounterStatus.success,
          countValue: state.countValue + 1,
        ),
      );
      emit(state);
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: CounterStatus.error));
    }
  }
}
