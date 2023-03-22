part of 'tour_details_bloc.dart';

abstract class TourDetailsState extends Equatable {
  const TourDetailsState();

  @override
  List<Object> get props => [];
}

class TourDetailsInitialState extends TourDetailsState {}

class TourDetailsLoadingState extends TourDetailsState {
  @override
  List<Object> get props => [];
}

class TourDetailsLoadedState extends TourDetailsState {
  const TourDetailsLoadedState({required this.tourDetails});

  final TourDetails tourDetails;

  @override
  List<Object> get props => [tourDetails];
}

class TourDetailsErrorState extends TourDetailsState {
  const TourDetailsErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [];
}
