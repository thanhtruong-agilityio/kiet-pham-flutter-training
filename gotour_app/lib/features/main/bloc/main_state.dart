part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitialState extends MainState {}

class BestPlaceLoadingState extends MainState {
  @override
  List<Object> get props => [];
}

class BestPlaceLoadedState extends MainState {
  const BestPlaceLoadedState({
    required this.listBestPlace,
  });
  final List<BestPlace> listBestPlace;
  @override
  List<Object> get props => [listBestPlace];
}

class BestPlaceErrorState extends MainState {
  const BestPlaceErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [];
}

class MyLocationLoadingState extends MainState {
  @override
  List<Object> get props => [];
}

class MyLocationLoadedState extends MainState {
  const MyLocationLoadedState({
    required this.listMyLocation,
  });
  final List<MyLocation> listMyLocation;
  @override
  List<Object> get props => [listMyLocation];
}

class MyLocationErrorState extends MainState {
  const MyLocationErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [];
}
