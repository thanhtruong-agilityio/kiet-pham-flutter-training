import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotour_app/features/main/models/model_hot_place.dart';
import 'package:gotour_app/features/main/models/model_my_location.dart';
import 'package:gotour_app/features/main/repository/main_repository.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({required this.mainRepository}) : super(MainInitialState()) {
    on<MainRequested>(_handleMainRequested);
    on<MainClickMyLocationEvent>(_handleMainClickMyLocation);
    on<MainClickBestPlaceEvent>(_handleMainClickBestPlace);
  }

  final MainRepository mainRepository;

  Future<void> _handleMainRequested(
    MainRequested event,
    Emitter<MainState> emit,
  ) async {
    try {
      final listBestPlace = await mainRepository.fetchDataHotPlace();
      emit(
        MainLoadedState(
          listBestPlace: listBestPlace,
          listMyLocation: [],
        ),
      );
    } on Exception catch (e) {
      emit(MainErrorState(e));
    }
  }

  Future<void> _handleMainClickMyLocation(
    MainClickMyLocationEvent event,
    Emitter<MainState> emit,
  ) async {
    try {
      // await mainRepository.fetchDataMyLocation();
      // emit(const MainLoadedState());
    } on Exception catch (e) {
      emit(MainErrorState(e));
    }
  }

  Future<void> _handleMainClickBestPlace(
    MainClickBestPlaceEvent event,
    Emitter<MainState> emit,
  ) async {
    try {
      // await mainRepository.fetchDataHotPlace();
      // emit(const MainLoadedState());
    } on Exception catch (e) {
      emit(MainErrorState(e));
    }
  }
}
