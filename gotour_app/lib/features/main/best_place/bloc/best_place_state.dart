part of 'best_place_bloc.dart';

abstract class BestPlaceState extends Equatable {
  const BestPlaceState();

  @override
  List<Object> get props => [];
}

class BestPlaceLoadingState extends BestPlaceState {
  @override
  List<Object> get props => [];
}

class BestPlaceLoadedState extends BestPlaceState {
  const BestPlaceLoadedState({
    required this.listBestPlace,
  });
  final List<BestPlace> listBestPlace;
  @override
  List<Object> get props => [listBestPlace];
}
