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
  const TourDetailsLoadedState({
    required this.tourDetails,
    required this.isBookmark,
  });

  final TourDetails tourDetails;
  final bool isBookmark;

  @override
  List<Object> get props => [tourDetails, isBookmark];
}

class TourDetailsErrorState extends TourDetailsState {
  const TourDetailsErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [];
}

class ChangeBookmarkSuccessState extends TourDetailsState {
  const ChangeBookmarkSuccessState({
    required this.isBookmark,
  });

  final bool isBookmark;

  @override
  List<Object> get props => [isBookmark];
}

class ChangeBookmarkErrorState extends TourDetailsState {
  const ChangeBookmarkErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [];
}
