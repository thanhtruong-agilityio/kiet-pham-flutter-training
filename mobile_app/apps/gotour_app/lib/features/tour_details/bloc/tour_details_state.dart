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
  });

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

class TourDetailsImageListLoadingState extends TourDetailsState {
  @override
  List<Object> get props => [];
}

class TourDetailsImageListLoadedState extends TourDetailsState {
  const TourDetailsImageListLoadedState({
    required this.imageList,
    required this.bookmark,
  });

  final List<String> imageList;
  final bool bookmark;

  @override
  List<Object> get props => [imageList];
}

class TourDetailsImageListErrorState extends TourDetailsState {
  const TourDetailsImageListErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [];
}

class BookMarkTheTourLoadingState extends TourDetailsState {
  @override
  List<Object> get props => [];
}

class ChangeBookmarkSuccessState extends TourDetailsState {
  const ChangeBookmarkSuccessState({
    required this.bookmark,
  });

  final bool bookmark;

  @override
  List<Object> get props => [bookmark];
}

class ChangeBookmarkErrorState extends TourDetailsState {
  const ChangeBookmarkErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [];
}
