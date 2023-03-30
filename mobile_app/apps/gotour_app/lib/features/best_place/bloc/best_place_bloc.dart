import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotour_app/features/best_place/model/best_place.dart';
import 'package:gotour_app/features/best_place/repository/best_place_repository.dart';

part 'best_place_event.dart';
part 'best_place_state.dart';

class BestPlaceBloc extends Bloc<BestPlaceEvent, BestPlaceState> {
  BestPlaceBloc({
    required this.bestPlaceRepository,
  }) : super(BestPlaceInitial()) {
    on<BestPlaceFetchDataEvent>(_handleBestPlaceFetchDataEvent);
  }

  final BestPlaceRepository bestPlaceRepository;

  Future<void> _handleBestPlaceFetchDataEvent(
    BestPlaceFetchDataEvent event,
    Emitter<BestPlaceState> emit,
  ) async {
    try {
      emit(BestPlaceLoadingState());
      final bestPlaceList = await bestPlaceRepository.fetchDataBestPlace();
      emit(
        BestPlaceLoadedState(
          bestPlaceList: bestPlaceList,
        ),
      );
    } on Exception catch (e) {}
  }
}
