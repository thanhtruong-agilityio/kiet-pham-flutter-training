import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotour_app/features/home/models/best_place.dart';
import 'package:gotour_app/features/home/models/my_location.dart';
import 'package:gotour_app/features/home/models/tour_id.dart';

class HomeRepository {
  final _firebaseFirestoreBestPlace =
      FirebaseFirestore.instance.collection('tour-details');

  final _firebaseFirestoreTourBookMarks =
      FirebaseFirestore.instance.collection('book-marks');

  // Fetch Data Best Place from the firebase
  Future<List<BestPlace>> fetchDataBestPlace() async {
    final data = await _firebaseFirestoreBestPlace
        .where('hotPlace', isEqualTo: true)
        .get();
    return (data.docs)
        .map(
          (tour) => BestPlace(
            id: tour['id'] as String,
            imageUrl: tour['imageUrl'] as String,
            location: tour['location'] as String,
            placeName: tour['placeName'] as String,
            price: tour['price'] as String,
          ),
        )
        .toList();
  }

  // Fetch List Tour from the firebase
  Future<List<TourId>> fetchListTourBookmarkByUser({
    required String idUser,
  }) async {
    final data = await _firebaseFirestoreTourBookMarks
        .where('userId', isEqualTo: idUser)
        .get();
    return (data.docs)
        .map((tour) => TourId(tourId: tour['tourId'] as String))
        .toList();
  }

  // Fetch My Location Place from the firebase
  Future<List<MyLocation>> getDataFromDocuments({
    required List<String> documentIds,
  }) async {
    if (documentIds.isNotEmpty) {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('tour-details')
          .where(FieldPath.documentId, whereIn: documentIds)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final dataList = querySnapshot.docs
            .map<MyLocation>(
              (json) => MyLocation(
                id: json['id'] as String,
                descriptions: json['descriptions'] as String,
                imageUrl: json['imageUrl'] as String,
                location: json['location'] as String,
                placeName: json['placeName'] as String,
              ),
            )
            .toList();
        return dataList;
      }
    }
    return [];
  }

  // Detele document when user click icon bookmark
  Future<void> deleteBookmark(String userId, String tourId) async {
    final snapshot = await _firebaseFirestoreTourBookMarks
        .where('userId', isEqualTo: userId)
        .where('tourId', isEqualTo: tourId)
        .get();
    for (final document in snapshot.docs) {
      await document.reference.delete();
    }
  }
}
