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
    // event un bookmark
    on<UnbookmarkTourEvent>(_handleUnbookmark);
    // event fetch data
    on<HomeFetchDataEvent>(_handleHomeFetch);
  }

  final HomeRepository mainRepository;

  Future<void> _handleUnbookmark(
    UnbookmarkTourEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      // emit(UnBookmarkLoadingState());
      // fetch user id
      final userId = FirebaseAuth.instance.currentUser?.uid;

      // handle unbookmark
      await mainRepository.unBookmark(
        userId: userId ?? '',
        tourId: event.tourId,
      );

      // remove tour from local data
      final oldData = state as HomeLoadedState;
      oldData.myLocations.removeAt(event.index);

      // emit unbookmark success state
      emit(
        UnBookmarkSuccessState(
          myLocations: oldData.myLocations,
        ),
      );

      //emit home loaded state
      emit(
        HomeLoadedState(
          bestPlaces: oldData.bestPlaces,
          myLocations: oldData.myLocations,
        ),
      );
    } on Exception catch (e) {
      // case error
      emit(UnBookmarkErrorState(error: e.toString()));
    }
  }

  Future<void> _handleHomeFetch(
    HomeFetchDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      // emit loading state
      emit(HomeLoadingState());

      // fetch user id
      final userId = FirebaseAuth.instance.currentUser!.uid;

      // fetch list tour bookmark with id
      final tourIds =
          await mainRepository.fetchListTourBookmarkByUser(userId: userId);

      // add tour to list
      final tourIdList = tourIds.map((tourId) => tourId.tourId).toList();

      // fetch data mylocation
      final myLocations =
          await mainRepository.getDataFromDocuments(documentIds: tourIdList);

      // fetch data best place
      final bestPlaces = await mainRepository.fetchDataBestPlace();

      // emit success state
      emit(
        HomeLoadedState(
          bestPlaces: bestPlaces,
          myLocations: myLocations,
        ),
      );
    } on Exception catch (e) {
      // case error
      emit(HomeErrorState(error: e.toString()));
    }
  }
}
