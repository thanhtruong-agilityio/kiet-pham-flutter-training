part of 'best_place_bloc.dart';

@immutable
abstract class BestPlaceState extends Equatable {
  const BestPlaceState();

  @override
  List<Object> get props => [];
}

class BestPlaceInitial extends BestPlaceState {}

class BestPlaceLoadingState extends BestPlaceState {}

class BestPlaceLoadedState extends BestPlaceState {
  const BestPlaceLoadedState({
    required this.bestPlaceList,
  });

  final List<BestPlace> bestPlaceList;

  @override
  List<Object> get props => [bestPlaceList];
}

class BestPlaceErrorState extends BestPlaceState {}
