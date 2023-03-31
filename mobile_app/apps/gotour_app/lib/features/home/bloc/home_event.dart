part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeFetchDataEvent extends HomeEvent {}

class BestPlaceFetchDataEvent extends HomeEvent {}

class MyLocationFetchDataEvent extends HomeEvent {}

class DeleteMyLocationEvent extends HomeEvent {
  const DeleteMyLocationEvent({
    required this.tourId,
    required this.index,
  });

  final String tourId;
  final int index;
}
