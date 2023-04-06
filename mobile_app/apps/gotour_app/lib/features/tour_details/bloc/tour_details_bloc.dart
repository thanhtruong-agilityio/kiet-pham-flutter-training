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
    // fetch data tour detail event
    on<TourDetailsFetchDataEvent>(_fetchData);
    //
    on<TourDetailBookmarkEvent>(_bookmark);
  }

  final TourDetailsRepository tourDetailsRepository;

  Future<void> _fetchData(
    TourDetailsFetchDataEvent event,
    Emitter<TourDetailsState> emit,
  ) async {
    try {
      // load indicator
      emit(TourDetailsLoadingState());

      // fetch data from firebase
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final tourDetails = await tourDetailsRepository.fetchDataTour(
        tourId: event.id,
      );
      final isBookMark = await tourDetailsRepository.checkTourMarked(
        tourId: event.id,
        userId: userId,
      );

      // load data success
      emit(
        TourDetailsLoadedState(
          tourDetails: tourDetails,
          isBookmark: isBookMark,
        ),
      );
    } on Exception catch (e) {
      // error case
      emit(TourDetailsErrorState(error: e.toString()));
    }
  }

  Future<void> _bookmark(
    TourDetailBookmarkEvent event,
    Emitter<TourDetailsState> emit,
  ) async {
    try {
      // get tour details
      final tourDetail = (state as TourDetailsLoadedState).tourDetails;
      final userId = FirebaseAuth.instance.currentUser!.uid;

      // check bookmark
      await tourDetailsRepository.handleBookmarkTour(
        isBookmark: event.isBookmark,
        tourId: event.tourId,
        userId: userId,
      );

      // change bookmark
      final checkBookmark = !event.isBookmark;

      if (checkBookmark) {
        emit(BookmarkSuccessState(isBookmark: checkBookmark));
        emit(
          TourDetailsLoadedState(
            isBookmark: checkBookmark,
            tourDetails: tourDetail,
          ),
        );
      } else {
        emit(BookmarkSuccessState(isBookmark: checkBookmark));
        emit(
          TourDetailsLoadedState(
            isBookmark: checkBookmark,
            tourDetails: tourDetail,
          ),
        );
      }
    } on Exception catch (e) {
      // error case
      emit(BookmarkErrorState(error: e.toString()));
    }
  }
}
