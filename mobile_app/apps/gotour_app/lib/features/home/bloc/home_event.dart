part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

// event home page fetch data
class HomeFetchDataEvent extends HomeEvent {}

// event best place fetch data
class BestPlaceFetchDataEvent extends HomeEvent {}

// event my location fetch data
class MyLocationFetchDataEvent extends HomeEvent {}

// event unbookmark
class UnbookmarkTourEvent extends HomeEvent {
  const UnbookmarkTourEvent({
    required this.tourId,
    required this.index,
  });

  final String tourId;
  final int index;
}
