part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  const HomeLoadedState({
    required this.myLocations,
    required this.bestPlaces,
  });

  final List<BestPlace> bestPlaces;
  final List<MyLocation> myLocations;

  @override
  List<Object> get props => [bestPlaces, myLocations];
}

class HomeErrorState extends HomeState {
  const HomeErrorState({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => [error];
}

class UnBookmarkSuccessState extends HomeState {
  const UnBookmarkSuccessState({
    required this.myLocations,
  });

  final List<MyLocation> myLocations;

  @override
  List<Object> get props => [myLocations];
}

class UnBookmarkErrorState extends HomeState {
  const UnBookmarkErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [];
}
