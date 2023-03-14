part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitialState extends MainState {
  @override
  List<Object> get props => [];
}

class MainLoadedState extends MainState {
  const MainLoadedState({
    required this.listMyLocation,
    required this.listBestPlace,
  });

  final List<MyLocation> listMyLocation;
  final List<HotPlace> listBestPlace;

  @override
  List<Object> get props => [listMyLocation, listBestPlace];
}

class MainErrorState extends MainState {
  const MainErrorState(this.error);

  final Exception error;
  @override
  List<Object> get props => [];
}
