import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotour_app/features/tour_details/model/model_tour_details.dart';
import 'package:gotour_app/features/tour_details/repository/tour_details_repository.dart';

part 'tour_details_event.dart';
part 'tour_details_state.dart';

class TourDetailsBloc extends Bloc<TourDetailsEvent, TourDetailsState> {
  TourDetailsBloc({required this.tourDetailsRepository})
      : super(TourDetailsInitialState()) {
    on<TourDetailsFetchDataEvent>(_handleTourDetailsFetchDataEvent);
    on<TourDetailsFetchImageListEvent>(_handleTourDetailsFetchImageListEvent);
  }

  final TourDetailsRepository tourDetailsRepository;

  Future<void> _handleTourDetailsFetchDataEvent(
    TourDetailsFetchDataEvent event,
    Emitter<TourDetailsState> emit,
  ) async {
    try {
      emit(TourDetailsLoadingState());
      final tourDetails = await tourDetailsRepository.fetchDataTour(
        idTour: event.id,
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
          await tourDetailsRepository.fetchListImage(idTour: event.id);

      final json = jsonEncode(imageList);
      print(json);
      emit(TourDetailsImageListLoadedState(imageList: imageList));
    } on Exception catch (e) {}
  }
}
