part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class BestPlaceFetchDataEvent extends MainEvent {}

class MyLocationFetchDataEvent extends MainEvent {}

class DeleteMyLocationEvent extends MainEvent {
  const DeleteMyLocationEvent({required this.idTour});

  final String idTour;
}
