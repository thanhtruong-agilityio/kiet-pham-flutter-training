part of 'hot_place_bloc.dart';

@immutable
abstract class HotPlaceEvent {}

class HotPlaceFetchDataEvent extends HotPlaceEvent {
  HotPlaceFetchDataEvent({
    required this.tourId,
  });

  final String tourId;
}

class PressTheBookmarkButtonEvent extends HotPlaceEvent {
  PressTheBookmarkButtonEvent({
    required this.tourId,
    required this.isBookmark,
  });

  final String tourId;
  final bool isBookmark;
}
