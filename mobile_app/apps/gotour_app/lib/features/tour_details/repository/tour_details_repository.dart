import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotour_app/features/tour_details/model/tour_details.dart';

class TourDetailsRepository {
  final _firebaseFirestoreTourDetails =
      FirebaseFirestore.instance.collection('tour-details');

  final _firebaseFirestoreBookMarks =
      FirebaseFirestore.instance.collection('book-marks');

  Future<TourDetails> fetchDataTour({
    required String tourId,
  }) async {
    final data = await _firebaseFirestoreTourDetails.doc(tourId).get();

    return TourDetails(
      id: data['id'] as String,
      imageUrl: data['imageUrl'] as String,
      location: data['location'] as String,
      placeName: data['placeName'] as String,
      price: data['price'] as String,
      descriptions: data['descriptions'] as String,
      weather: data['weather'] as String,
      imageList: List<String>.from(data['imageList'] as List),
    );
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
