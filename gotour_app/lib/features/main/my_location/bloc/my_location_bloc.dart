import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotour_app/features/main/my_location/model/model_my_location.dart';
import 'package:gotour_app/features/main/my_location/repository/my_location_repository.dart';

part 'my_location_event.dart';
part 'my_location_state.dart';

class MyLocationBloc extends Bloc<MyLocationEvent, MyLocationState> {
  MyLocationBloc({required this.repository}) : super(MyLocationLoadingState()) {
    on<MyLocationRequestedEvent>(_handleMyLocationRequestedEvent);
  }

  final MyLocationRepository repository;

  Future<void> _handleMyLocationRequestedEvent(
    MyLocationRequestedEvent event,
    Emitter<MyLocationState> emit,
  ) async {
    final idUser = FirebaseAuth.instance.currentUser!.uid;
    final idTours =
        await repository.fetchListTourBookmarkByUser(idUser: idUser);

    final listIdTour = idTours.map((idTour) => idTour.idTour).toList();

    final listMyLocation =
        await repository.getDataFromDocuments(documentIds: listIdTour);
    emit(MyLocationLoadedState(listMyLocation: listMyLocation));
  }
}
