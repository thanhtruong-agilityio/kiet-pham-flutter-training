import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotour_app/core/model/tour_model.dart';

class BestPlaceRepository {
  final _firebaseFirestoreBestPlace =
      FirebaseFirestore.instance.collection('tour-details');

  // Fetch Data Best Place from the firebase
  Future<List<TourModel>> fetchDataBestPlace() async {
    final data = await _firebaseFirestoreBestPlace
        .where('hotPlace', isEqualTo: true)
        .get();

    final response = (data.docs)
        .map(
          (json) => TourModel.fromJsonOfBestPlace(json.data()),
        )
        .toList();

    return response;
  }
}
