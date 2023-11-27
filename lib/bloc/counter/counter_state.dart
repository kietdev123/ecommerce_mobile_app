part of 'counter_bloc.dart';

enum CounterStatus { initial, success, error, loading, selected }

// extension CounterStatusX on CounterStatus {
//   bool get isInitial => this == CounterStatus.initial;
//   bool get isSuccess => this == CounterStatus.success;
//   bool get isError => this == CounterStatus.error;
//   bool get isLoading => this == CounterStatus.loading;
//   bool get isSelected => this == CounterStatus.selected;
// }

class CounterState extends Equatable {
  CounterState({
    this.status = CounterStatus.initial,
    this.countValue = 0,
  });

  int countValue;
  CounterStatus status;

  @override
  List<Object?> get props => [countValue];

  CounterState copyWith({
    int? countValue,
    CounterStatus? status,
  }) {
    if (countValue == null) {
      print(this.countValue);
    } else {
      print(countValue);
    }

    return CounterState(
      countValue: (countValue == null) ? this.countValue : countValue,
      status: (status == null) ? this.status : status,
    );
  }

  void increaseCountValue() {
    countValue++;
  }

  void decreaseCountValue() {
    countValue--;
  }
}
