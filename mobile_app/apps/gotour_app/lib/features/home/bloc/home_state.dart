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
    required this.bestPlaceList,
    required this.myLocationList,
  });

  final List<BestPlace> bestPlaceList;
  final List<MyLocation> myLocationList;

  @override
  List<Object> get props => [bestPlaceList, myLocationList];
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
    required this.listMyLocation,
  });
  final List<MyLocation> listMyLocation;
  @override
  List<Object> get props => [listMyLocation];
}

class UnBookmarkErrorState extends HomeState {
  const UnBookmarkErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [];
}
