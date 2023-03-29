import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotour_app/features/home/models/best_place.dart';
import 'package:gotour_app/features/home/models/my_location.dart';
import 'package:gotour_app/features/home/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.mainRepository}) : super(HomeInitialState()) {
    on<MyLocationFetchDataEvent>(_handleMyLocationRequestedEvent);
    on<BestPlaceFetchDataEvent>(_handleBestPlaceRequestedEvent);
    on<DeleteMyLocationEvent>(_handleDeleteMyLocationEvent);
  }

  final HomeRepository mainRepository;

  Future<void> _handleMyLocationRequestedEvent(
    MyLocationFetchDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(MyLocationLoadingState());
      final idUser = FirebaseAuth.instance.currentUser!.uid;
      final tourIds =
          await mainRepository.fetchListTourBookmarkByUser(idUser: idUser);

      final tourIdList = tourIds.map((tourId) => tourId.tourId).toList();

      final listMyLocation =
          await mainRepository.getDataFromDocuments(documentIds: tourIdList);
      emit(MyLocationLoadedState(listMyLocation: listMyLocation));
    } on Exception catch (e) {
      emit(MyLocationErrorState(error: e.toString()));
    }
  }

  Future<void> _handleBestPlaceRequestedEvent(
    BestPlaceFetchDataEvent event,
    Emitter<HomeState> emit,
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
    Emitter<HomeState> emit,
  ) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      await mainRepository.unBookmark(userId: userId, tourId: event.tourId);

      final listBeforDelete = state as MyLocationLoadedState;
      listBeforDelete.listMyLocation.removeAt(event.index);
      emit(
        UnBookmarkSuccessState(
          listMyLocation: listBeforDelete.listMyLocation,
        ),
      );
      emit(
        MyLocationLoadedState(
          listMyLocation: listBeforDelete.listMyLocation,
        ),
      );
    } on Exception catch (e) {
      emit(UnBookmarkErrorState(error: e.toString()));
    }
  }
}
