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
    this.isBookmark = false,
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
  List<Object> get props => [error];
}

class BookmarkSuccessState extends TourDetailsState {
  const BookmarkSuccessState({
    this.isBookmark = false,
  });

  final bool isBookmark;

  @override
  List<Object> get props => [isBookmark];
}

class BookmarkErrorState extends TourDetailsState {
  const BookmarkErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
