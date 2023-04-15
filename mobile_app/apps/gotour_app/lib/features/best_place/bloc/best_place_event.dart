part of 'best_place_bloc.dart';

@immutable
abstract class BestPlaceEvent {}

// fetch data event
class BestPlaceFetchDataEvent extends BestPlaceEvent {}

// search event
class BestPlaceSearchEvent extends BestPlaceEvent {
  BestPlaceSearchEvent({
    required this.value,
  });

  final String value;
}
