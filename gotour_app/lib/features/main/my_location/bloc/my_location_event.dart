part of 'my_location_bloc.dart';

abstract class MyLocationEvent extends Equatable {
  const MyLocationEvent();

  @override
  List<Object> get props => [];
}

class MyLocationRequestedEvent extends MyLocationEvent {}
