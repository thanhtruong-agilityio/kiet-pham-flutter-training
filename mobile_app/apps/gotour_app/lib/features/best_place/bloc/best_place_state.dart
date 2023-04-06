part of 'best_place_bloc.dart';

@immutable
abstract class BestPlaceState extends Equatable {
  const BestPlaceState();

  @override
  List<Object> get props => [];
}

// initial state
class BestPlaceInitial extends BestPlaceState {}

// loading state
class BestPlaceLoadingState extends BestPlaceState {}

// success state
class BestPlaceLoadedState extends BestPlaceState {
  const BestPlaceLoadedState({
    required this.bestPlaceList,
  });

  final List<BestPlace> bestPlaceList;

  @override
  List<Object> get props => [bestPlaceList];
}

// error state
class BestPlaceErrorState extends BestPlaceState {
  const BestPlaceErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
