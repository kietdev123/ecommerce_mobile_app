part of 'counter_bloc.dart';

class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class IncreaseCounter extends CounterEvent {}

class DecreaseCounter extends CounterEvent {}

// class SelectCounter extends CounterEvent {
//   SelectCounter({
//     required this.idSelected,
//   });
//   final int idSelected;

//   @override
//   List<Object?> get props => [idSelected];
// }
