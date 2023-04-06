part of 'tour_details_bloc.dart';

abstract class TourDetailsEvent extends Equatable {
  const TourDetailsEvent();

  @override
  List<Object> get props => [];
}

class TourDetailsFetchDataEvent extends TourDetailsEvent {
  const TourDetailsFetchDataEvent({
    required this.id,
  });

  final String id;
}

class TourDetailBookmarkEvent extends TourDetailsEvent {
  const TourDetailBookmarkEvent({
    required this.tourId,
    this.isBookmark = false,
  });

  final String tourId;
  final bool isBookmark;
}
