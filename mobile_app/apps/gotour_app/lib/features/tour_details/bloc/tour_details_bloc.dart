import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotour_app/features/tour_details/model/tour_details.dart';
import 'package:gotour_app/features/tour_details/repository/tour_details_repository.dart';

part 'tour_details_event.dart';
part 'tour_details_state.dart';

class TourDetailsBloc extends Bloc<TourDetailsEvent, TourDetailsState> {
  TourDetailsBloc({required this.tourDetailsRepository})
      : super(TourDetailsInitialState()) {
    on<TourDetailsFetchDataEvent>(_handleTourDetailsFetchDataEvent);
    on<TourDetailsFetchImageListEvent>(_handleTourDetailsFetchImageListEvent);
    on<PressTheTourBookmarkButtonEvent>(_handleCheckBookMarkTourEvent);
  }

  final TourDetailsRepository tourDetailsRepository;

  Future<void> _handleTourDetailsFetchDataEvent(
    TourDetailsFetchDataEvent event,
    Emitter<TourDetailsState> emit,
  ) async {
    try {
      emit(TourDetailsLoadingState());
      final tourDetails = await tourDetailsRepository.fetchDataTour(
        tourId: event.id,
      );
      emit(TourDetailsLoadedState(tourDetails: tourDetails));
    } on Exception catch (e) {}
  }

  Future<void> _handleTourDetailsFetchImageListEvent(
    TourDetailsFetchImageListEvent event,
    Emitter<TourDetailsState> emit,
  ) async {
    try {
      final imageList =
          await tourDetailsRepository.fetchListImage(tourId: event.id);
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final checkBookmark = await tourDetailsRepository.tourHasBeenMarked(
        userId: userId,
        tourId: event.id,
      );
      emit(
        TourDetailsImageListLoadedState(
          imageList: imageList,
          bookmark: checkBookmark,
        ),
      );
    } on Exception catch (e) {}
  }

  Future<void> _handleCheckBookMarkTourEvent(
    PressTheTourBookmarkButtonEvent event,
    Emitter<TourDetailsState> emit,
  ) async {
    try {
      final imageList = state as TourDetailsImageListLoadedState;
      final idUser = FirebaseAuth.instance.currentUser!.uid;

      await tourDetailsRepository.handleBookmarkTour(
        bookmark: event.isBookmark,
        tourId: event.tourId,
        userId: idUser,
      );
      final checkBookmark = !event.isBookmark;
      if (checkBookmark == true) {
        emit(ChangeBookmarkSuccessState(bookmark: checkBookmark));
        emit(
          TourDetailsImageListLoadedState(
            bookmark: checkBookmark,
            imageList: imageList.imageList,
          ),
        );
      } else {
        emit(ChangeBookmarkSuccessState(bookmark: checkBookmark));
        emit(
          TourDetailsImageListLoadedState(
            bookmark: checkBookmark,
            imageList: imageList.imageList,
          ),
        );
      }
    } on Exception catch (e) {
      emit(ChangeBookmarkErrorState(error: e.toString()));
    }
  }
}
