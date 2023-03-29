part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class BestPlaceLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class BestPlaceLoadedState extends HomeState {
  const BestPlaceLoadedState({
    required this.listBestPlace,
  });
  final List<BestPlace> listBestPlace;
  @override
  List<Object> get props => [listBestPlace];
}

class BestPlaceErrorState extends HomeState {
  const BestPlaceErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [];
}

class MyLocationLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class MyLocationLoadedState extends HomeState {
  const MyLocationLoadedState({
    required this.listMyLocation,
  });
  final List<MyLocation> listMyLocation;
  @override
  List<Object> get props => [listMyLocation];
}

class MyLocationErrorState extends HomeState {
  const MyLocationErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [];
}

class DeleteMyLocationLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class DeleteMyLocationSuccessState extends HomeState {
  const DeleteMyLocationSuccessState({
    required this.listMyLocation,
  });
  final List<MyLocation> listMyLocation;
  @override
  List<Object> get props => [listMyLocation];
}

class DeleteMyLocationErrorState extends HomeState {
  const DeleteMyLocationErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [];
}
