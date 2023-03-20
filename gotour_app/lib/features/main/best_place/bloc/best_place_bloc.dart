import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotour_app/features/main/best_place/model/model_best_place.dart';
import 'package:gotour_app/features/main/best_place/repository/best_place_repository.dart';

part 'best_place_event.dart';
part 'best_place_state.dart';

class BestPlaceBloc extends Bloc<BestPlaceEvent, BestPlaceState> {
  BestPlaceBloc({required this.repository}) : super(BestPlaceLoadingState()) {
    on<BestPlaceRequestedEvent>(_handleBestPlaceRequestedEvent);
  }
  final BestPlaceRepository repository;

  Future<void> _handleBestPlaceRequestedEvent(
    BestPlaceRequestedEvent event,
    Emitter<BestPlaceState> emit,
  ) async {
    try {
      final listBestPlace = await repository.fetchDataBestPlace();
      final json = jsonEncode(listBestPlace);
      print(json);
      emit(BestPlaceLoadedState(listBestPlace: listBestPlace));
    } on Exception catch (e) {}
  }
}
