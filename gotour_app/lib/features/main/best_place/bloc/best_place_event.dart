part of 'best_place_bloc.dart';

abstract class BestPlaceEvent extends Equatable {
  const BestPlaceEvent();

  @override
  List<Object> get props => [];
}

class BestPlaceRequestedEvent extends BestPlaceEvent {}
