import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotour_app/core/model/tour_model.dart';
import 'package:gotour_app/features/home/models/tour_id.dart';

class HomeRepository {
  final _firebaseFirestoreBestPlace =
      FirebaseFirestore.instance.collection('tour-details');

  final _firebaseFirestoreTourBookMarks =
      FirebaseFirestore.instance.collection('book-marks');

  // Fetch Data Best Place from the firebase
  Future<List<TourModel>> fetchDataBestPlace() async {
    final data = await _firebaseFirestoreBestPlace
        .where('hotPlace', isEqualTo: true)
        .get();
    return (data.docs)
        .map(
          (tour) => TourModel.fromJsonOfBestPlace(tour.data()),
        )
        .toList();
  }

  // Fetch List Tour from the firebase
  Future<List<TourId>> fetchListTourBookmarkByUser({
    required String userId,
  }) async {
    // fetch data with userId
    final data = await _firebaseFirestoreTourBookMarks
        .where('userId', isEqualTo: userId)
        .get();
    return (data.docs).map((tour) => TourId.fromJson(tour.data())).toList();
  }

  // Fetch My Location Place from the firebase
  Future<List<TourModel>> getDataFromDocuments({
    required List<String> documentIds,
  }) async {
    // fetch data with documentIds
    if (documentIds.isNotEmpty) {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('tour-details')
          .where(FieldPath.documentId, whereIn: documentIds)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final dataList = querySnapshot.docs
            .map<TourModel>(
              (json) => TourModel.fromJsonOfMyLocation(
                json.data() as Map<String, dynamic>? ?? {},
              ),
            )
            .toList();
        return dataList;
      }
    }
    return [];
  }

  // Detele document when user click icon bookmark
  Future<void> unBookmark({
    required String userId,
    required String tourId,
  }) async {
    // fetch data from firebase
    final snapshot = await _firebaseFirestoreTourBookMarks
        .where('userId', isEqualTo: userId)
        .where('tourId', isEqualTo: tourId)
        .get();

    // delete item
    if (snapshot.docs.isNotEmpty) {
      for (final document in snapshot.docs) {
        await document.reference.delete();
      }
    }
  }
}
