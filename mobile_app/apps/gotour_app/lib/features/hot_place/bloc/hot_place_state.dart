part of 'hot_place_bloc.dart';

@immutable
abstract class HotPlaceState extends Equatable {
  const HotPlaceState();

  @override
  List<Object?> get props => [];
}

class HotPlaceInitialState extends HotPlaceState {}

class HotPlaceLoadingState extends HotPlaceState {}

class HotPlaceLoadedState extends HotPlaceState {
  const HotPlaceLoadedState({
    required this.hotPlace,
    this.isBookMark = false,
  });

  final TourModel hotPlace;
  final bool isBookMark;

  @override
  List<Object?> get props => [hotPlace, isBookMark];
}

class HotPlaceErrorState extends HotPlaceState {
  const HotPlaceErrorState({this.error});

  final String? error;

  @override
  List<Object?> get props => [error];
}

class ChangeBookmarkHotPlaceSuccessState extends HotPlaceState {
  const ChangeBookmarkHotPlaceSuccessState({
    this.bookmark = false,
  });

  final bool bookmark;

  @override
  List<Object> get props => [bookmark];
}

class ChangeBookmarkHotPlaceErrorState extends HotPlaceState {
  const ChangeBookmarkHotPlaceErrorState({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => [error];
}
