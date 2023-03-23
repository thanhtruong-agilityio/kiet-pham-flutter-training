import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotour_app/features/main/models/model_best_place.dart';
import 'package:gotour_app/features/main/models/model_my_location.dart';
import 'package:gotour_app/features/main/repository/main_repository.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({required this.mainRepository}) : super(MainInitialState()) {
    on<MyLocationFetchDataEvent>(_handleMyLocationRequestedEvent);
    on<BestPlaceFetchDataEvent>(_handleBestPlaceRequestedEvent);
    on<DeleteMyLocationEvent>(_handleDeleteMyLocationEvent);
  }

  final MainRepository mainRepository;

  Future<void> _handleMyLocationRequestedEvent(
    MyLocationFetchDataEvent event,
    Emitter<MainState> emit,
  ) async {
    try {
      emit(MyLocationLoadingState());
      final idUser = FirebaseAuth.instance.currentUser!.uid;
      final idTours =
          await mainRepository.fetchListTourBookmarkByUser(idUser: idUser);

      final listIdTour = idTours.map((idTour) => idTour.idTour).toList();

      final listMyLocation =
          await mainRepository.getDataFromDocuments(documentIds: listIdTour);
      emit(MyLocationLoadedState(listMyLocation: listMyLocation));
    } on Exception catch (e) {
      emit(MyLocationErrorState(error: e.toString()));
    }
  }

  Future<void> _handleBestPlaceRequestedEvent(
    BestPlaceFetchDataEvent event,
    Emitter<MainState> emit,
  ) async {
    try {
      emit(BestPlaceLoadingState());
      final listBestPlace = await mainRepository.fetchDataBestPlace();
      emit(BestPlaceLoadedState(listBestPlace: listBestPlace));
    } on Exception catch (e) {
      emit(BestPlaceErrorState(error: e.toString()));
    }
  }

  Future<void> _handleDeleteMyLocationEvent(
    DeleteMyLocationEvent event,
    Emitter<MainState> emit,
  ) async {
    try {
      emit(DeleteMyLocationLoadingState());
      final idUser = FirebaseAuth.instance.currentUser!.uid;
      await mainRepository.deleteBookmark(idUser, event.idTour);
      final idTours =
          await mainRepository.fetchListTourBookmarkByUser(idUser: idUser);
      final listIdTour = idTours.map((idTour) => idTour.idTour).toList();

      final listMyLocation =
          await mainRepository.getDataFromDocuments(documentIds: listIdTour);
      emit(DeleteMyLocationSuccessState(listMyLocation: listMyLocation));
    } on Exception catch (e) {}
  }
}
