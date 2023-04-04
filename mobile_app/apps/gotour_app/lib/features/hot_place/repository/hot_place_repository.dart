import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotour_app/features/hot_place/model/hot_place.dart';

class HotPlaceRepository {
  final _firebaseFirestoreTourDetails =
      FirebaseFirestore.instance.collection('tour-details');

  final _firebaseFirestoreBookMarks =
      FirebaseFirestore.instance.collection('book-marks');

  Future<HotPlace> fetchDataTour({
    required String tourId,
  }) async {
    final data = await _firebaseFirestoreTourDetails.doc(tourId).get();
    return HotPlace.fromJson(data.data() ?? {});
  }

  Future<bool> tourHasBeenMarked({
    required String userId,
    required String tourId,
  }) async {
    final documentSnapshot = await _firebaseFirestoreBookMarks
        .where('userId', isEqualTo: userId)
        .where('tourId', isEqualTo: tourId)
        .get();
    if (documentSnapshot.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> handleBookmarkTour({
    required bool bookmark,
    required String userId,
    required String tourId,
  }) async {
    if (bookmark == true) {
      final snapshot = await _firebaseFirestoreBookMarks
          .where('userId', isEqualTo: userId)
          .where('tourId', isEqualTo: tourId)
          .get();
      for (final document in snapshot.docs) {
        await document.reference.delete();
      }
    } else {
      await _firebaseFirestoreBookMarks.add({
        'userId': userId,
        'tourId': tourId,
      });
    }
  }
}
