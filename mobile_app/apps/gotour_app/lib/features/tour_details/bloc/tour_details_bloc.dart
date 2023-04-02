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
    on<PressTheTourBookmarkButtonEvent>(_handleCheckBookMarkTourEvent);
  }

  final TourDetailsRepository tourDetailsRepository;

  Future<void> _handleTourDetailsFetchDataEvent(
    TourDetailsFetchDataEvent event,
    Emitter<TourDetailsState> emit,
  ) async {
    try {
      emit(TourDetailsLoadingState());
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final tourDetails = await tourDetailsRepository.fetchDataTour(
        tourId: event.id,
      );
      final isBookMark = await tourDetailsRepository.tourHasBeenMarked(
        tourId: event.id,
        userId: userId,
      );
      emit(
        TourDetailsLoadedState(
          tourDetails: tourDetails,
          isBookmark: isBookMark,
        ),
      );
    } on Exception catch (e) {}
  }

  Future<void> _handleCheckBookMarkTourEvent(
    PressTheTourBookmarkButtonEvent event,
    Emitter<TourDetailsState> emit,
  ) async {
    try {
      final stateLoaded = state as TourDetailsLoadedState;
      final idUser = FirebaseAuth.instance.currentUser!.uid;

      await tourDetailsRepository.handleBookmarkTour(
        bookmark: event.isBookmark,
        tourId: event.tourId,
        userId: idUser,
      );
      final checkBookmark = !event.isBookmark;
      if (checkBookmark == true) {
        emit(ChangeBookmarkSuccessState(isBookmark: checkBookmark));
        emit(
          TourDetailsLoadedState(
            isBookmark: checkBookmark,
            tourDetails: stateLoaded.tourDetails,
          ),
        );
      } else {
        emit(ChangeBookmarkSuccessState(isBookmark: checkBookmark));
        emit(
          TourDetailsLoadedState(
            isBookmark: checkBookmark,
            tourDetails: stateLoaded.tourDetails,
          ),
        );
      }
    } on Exception catch (e) {
      emit(ChangeBookmarkErrorState(error: e.toString()));
    }
  }
}
