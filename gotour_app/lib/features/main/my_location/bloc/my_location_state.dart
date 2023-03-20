part of 'my_location_bloc.dart';

abstract class MyLocationState extends Equatable {
  const MyLocationState();

  @override
  List<Object> get props => [];
}

class MyLocationLoadingState extends MyLocationState {
  @override
  List<Object> get props => [];
}

class MyLocationLoadedState extends MyLocationState {
  const MyLocationLoadedState({
    required this.listMyLocation,
  });
  final List<MyLocation> listMyLocation;
  @override
  List<Object> get props => [listMyLocation];
}
