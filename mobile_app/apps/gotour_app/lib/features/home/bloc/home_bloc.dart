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
    on<DeleteMyLocationEvent>(_handleDeleteMyLocationEvent);
    on<HomeFetchDataEvent>(_handleHomeFetchDataEvent);
  }

  final HomeRepository mainRepository;

  Future<void> _handleDeleteMyLocationEvent(
    DeleteMyLocationEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      await mainRepository.unBookmark(userId: userId, tourId: event.tourId);

      final beforDelete = state as HomeLoadedState;
      beforDelete.myLocations.removeAt(event.index);
      emit(
        UnBookmarkSuccessState(
          myLocations: beforDelete.myLocations,
        ),
      );
      emit(
        HomeLoadedState(
          bestPlaces: beforDelete.bestPlaces,
          myLocations: beforDelete.myLocations,
        ),
      );
    } on Exception catch (e) {
      emit(UnBookmarkErrorState(error: e.toString()));
    }
  }

  Future<void> _handleHomeFetchDataEvent(
    HomeFetchDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoadingState());
      final idUser = FirebaseAuth.instance.currentUser!.uid;
      final tourIds =
          await mainRepository.fetchListTourBookmarkByUser(idUser: idUser);

      final tourIdList = tourIds.map((tourId) => tourId.tourId).toList();

      final myLocations =
          await mainRepository.getDataFromDocuments(documentIds: tourIdList);

      final bestPlaces = await mainRepository.fetchDataBestPlace();
      emit(
        HomeLoadedState(
          bestPlaces: bestPlaces,
          myLocations: myLocations,
        ),
      );
    } on Exception catch (e) {
      emit(HomeErrorState(error: e.toString()));
    }
  }
}
