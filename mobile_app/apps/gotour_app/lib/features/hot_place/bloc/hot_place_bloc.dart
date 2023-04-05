import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotour_app/features/hot_place/model/hot_place.dart';
import 'package:gotour_app/features/hot_place/repository/hot_place_repository.dart';

part 'hot_place_event.dart';
part 'hot_place_state.dart';

class HotPlaceBloc extends Bloc<HotPlaceEvent, HotPlaceState> {
  HotPlaceBloc({
    required this.hotPlaceRepository,
  }) : super(HotPlaceInitialState()) {
    on<HotPlaceFetchDataEvent>(_handleHotPlaceFetchDataEvent);
    on<PressTheBookmarkButtonEvent>(_handlePressTheBookmarkButtonEvent);
  }

  final HotPlaceRepository hotPlaceRepository;

  Future<void> _handleHotPlaceFetchDataEvent(
    HotPlaceFetchDataEvent event,
    Emitter<HotPlaceState> emit,
  ) async {
    try {
      // loading state
      emit(HotPlaceLoadingState());

      // get user id
      final userId = FirebaseAuth.instance.currentUser?.uid ?? '';

      // fetch hot place with tourId
      final hotPlace =
          await hotPlaceRepository.fetchDataTour(tourId: event.tourId);

      // check bookmark
      final isBookMark = await hotPlaceRepository.checkTourMarked(
        tourId: event.tourId,
        userId: userId,
      );

      // success state
      emit(HotPlaceLoadedState(hotPlace: hotPlace, isBookMark: isBookMark));
    } on Exception catch (e) {
      // error case
      emit(HotPlaceErrorState(error: e.toString()));
    }
  }

  Future<void> _handlePressTheBookmarkButtonEvent(
    PressTheBookmarkButtonEvent event,
    Emitter<HotPlaceState> emit,
  ) async {
    try {
      // get hot place
      final hotPlace = (state as HotPlaceLoadedState).hotPlace;
      final idUser = FirebaseAuth.instance.currentUser!.uid;

      // handle bookmark
      await hotPlaceRepository.handleBookmarkTour(
        bookmark: event.isBookmark,
        tourId: event.tourId,
        userId: idUser,
      );
      final checkBookmark = !event.isBookmark;

      if (checkBookmark) {
        emit(ChangeBookmarkHotPlaceSuccessState(bookmark: checkBookmark));
        emit(
          HotPlaceLoadedState(
            hotPlace: hotPlace,
            isBookMark: checkBookmark,
          ),
        );
      } else {
        emit(ChangeBookmarkHotPlaceSuccessState(bookmark: checkBookmark));
        emit(
          HotPlaceLoadedState(
            hotPlace: hotPlace,
            isBookMark: checkBookmark,
          ),
        );
      }
    } on Exception catch (e) {
      // error case
      emit(ChangeBookmarkHotPlaceErrorState(error: e.toString()));
      emit(HotPlaceErrorState(error: e.toString()));
    }
  }
}
