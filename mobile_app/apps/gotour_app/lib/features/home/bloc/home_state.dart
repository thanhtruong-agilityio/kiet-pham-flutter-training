part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

// initial state
class HomeInitialState extends HomeState {}

// home loading state
class HomeLoadingState extends HomeState {}

// home loaded state
class HomeLoadedState extends HomeState {
  const HomeLoadedState({
    required this.myLocations,
    required this.bestPlaces,
  });

  final List<TourModel> bestPlaces;
  final List<TourModel> myLocations;

  @override
  List<Object> get props => [bestPlaces, myLocations];
}

// Home error state
class HomeErrorState extends HomeState {
  const HomeErrorState({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => [error];
}

// UnBookmark loading state
class UnBookmarkLoadingState extends HomeState {}

class UnBookmarkSuccessState extends HomeState {
  const UnBookmarkSuccessState({
    required this.myLocations,
  });

  final List<TourModel> myLocations;

  @override
  List<Object> get props => [myLocations];
}

// UnBookmark error state
class UnBookmarkErrorState extends HomeState {
  const UnBookmarkErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [];
}
