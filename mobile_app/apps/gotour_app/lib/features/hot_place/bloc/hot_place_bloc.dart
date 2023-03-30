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
      emit(HotPlaceLoadingState());
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final hotPlace =
          await hotPlaceRepository.fetchDataTour(tourId: event.tourId);
      final isBookMark = await hotPlaceRepository.tourHasBeenMarked(
        tourId: event.tourId,
        userId: userId,
      );
      emit(HotPlaceLoadedState(hotPlace: hotPlace, isBookMark: isBookMark));
    } on Exception catch (e) {}
  }

  Future<void> _handlePressTheBookmarkButtonEvent(
    PressTheBookmarkButtonEvent event,
    Emitter<HotPlaceState> emit,
  ) async {
    try {
      final data = state as HotPlaceLoadedState;
      final idUser = FirebaseAuth.instance.currentUser!.uid;

      await hotPlaceRepository.handleBookmarkTour(
        bookmark: event.isBookmark,
        tourId: event.tourId,
        userId: idUser,
      );
      final checkBookmark = !event.isBookmark;
      if (checkBookmark == true) {
        emit(ChangeBookmarkHotPlaceSuccessState(bookmark: checkBookmark));
        emit(
          HotPlaceLoadedState(
            hotPlace: data.hotPlace,
            isBookMark: checkBookmark,
          ),
        );
      } else {
        emit(ChangeBookmarkHotPlaceSuccessState(bookmark: checkBookmark));
        emit(
          HotPlaceLoadedState(
            hotPlace: data.hotPlace,
            isBookMark: checkBookmark,
          ),
        );
      }
    } on Exception catch (e) {
      emit(ChangeBookmarkHotPlaceErrorState(error: e.toString()));
      emit(HotPlaceErrorState());
    }
  }
}
