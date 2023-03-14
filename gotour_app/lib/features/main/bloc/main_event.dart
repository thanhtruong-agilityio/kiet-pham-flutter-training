part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  // const MainEvent();

  @override
  List<Object> get props => [];
}

class MainRequested extends MainEvent {}

class MainClickMyLocationEvent extends MainEvent {
  MainClickMyLocationEvent(this.tourId);

  final int tourId;
}

class MainClickBestPlaceEvent extends MainEvent {
  MainClickBestPlaceEvent(this.tourId);

  final int tourId;
}
