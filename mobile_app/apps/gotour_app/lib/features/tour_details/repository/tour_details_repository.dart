import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotour_app/core/model/tour_model.dart';

class TourDetailsRepository {
  final _firebaseFirestoreTourDetails =
      FirebaseFirestore.instance.collection('tour-details');

  final _firebaseFirestoreBookMarks =
      FirebaseFirestore.instance.collection('book-marks');

  // fetch data tour details
  Future<TourModel> fetchDataTour({
    required String tourId,
  }) async {
    // fetch data by tourId
    final data = await _firebaseFirestoreTourDetails.doc(tourId).get();

    // format tour details
    return TourModel.fromJsonOfTourDetails(data.data() ?? {});
  }

  // check bookmark tour
  Future<bool> checkTourMarked({
    required String userId,
    required String tourId,
  }) async {
    // check document has userId and tourId or not
    final documentSnapshot = await _firebaseFirestoreBookMarks
        .where('userId', isEqualTo: userId)
        .where('tourId', isEqualTo: tourId)
        .get();

    return documentSnapshot.docs.isNotEmpty;
  }

  // check bookmark
  Future<void> handleBookmarkTour({
    required String userId,
    required String tourId,
    bool isBookmark = false,
  }) async {
    if (isBookmark) {
      // check item exists and remove it from firebase
      final snapshot = await _firebaseFirestoreBookMarks
          .where('userId', isEqualTo: userId)
          .where('tourId', isEqualTo: tourId)
          .get();

      // delete
      for (final document in snapshot.docs) {
        await document.reference.delete();
      }
    } else {
      // add item
      await _firebaseFirestoreBookMarks.add({
        'userId': userId,
        'tourId': tourId,
      });
    }
  }
}
