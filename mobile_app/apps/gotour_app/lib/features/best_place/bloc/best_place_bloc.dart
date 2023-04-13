import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotour_app/core/model/tour_model.dart';
import 'package:gotour_app/features/best_place/repository/best_place_repository.dart';

part 'best_place_event.dart';
part 'best_place_state.dart';

class BestPlaceBloc extends Bloc<BestPlaceEvent, BestPlaceState> {
  BestPlaceBloc({
    required this.bestPlaceRepository,
  }) : super(BestPlaceInitial()) {
    // event fetch data
    on<BestPlaceFetchDataEvent>(_handleFetch);
  }

  final BestPlaceRepository bestPlaceRepository;

  Future<void> _handleFetch(
    BestPlaceFetchDataEvent event,
    Emitter<BestPlaceState> emit,
  ) async {
    try {
      // emit loading state
      emit(BestPlaceLoadingState());

      // handle fetch bestPlace list
      final bestPlaceList = await bestPlaceRepository.fetchDataBestPlace();

      // emit success state
      emit(
        BestPlaceLoadedState(
          bestPlaceList: bestPlaceList,
        ),
      );
    } on Exception catch (e) {
      // case error
      emit(BestPlaceErrorState(error: e.toString()));
    }
  }
}
