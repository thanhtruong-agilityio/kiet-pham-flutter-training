import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gotour_app/features/tour_details/model/model_tour_details.dart';

class TourDetailsRepository {
  final _firebaseFirestoreTourDetails =
      FirebaseFirestore.instance.collection('tour-details');

  final _firebaseFirestoreBookMarks =
      FirebaseFirestore.instance.collection('book-marks');

  Future<TourDetails> fetchDataTour({
    required String idTour,
  }) async {
    final data = await _firebaseFirestoreTourDetails.doc(idTour).get();
    return TourDetails(
      id: data['id'] as String,
      imageUrl: data['imageUrl'] as String,
      location: data['location'] as String,
      placeName: data['placeName'] as String,
      price: data['price'] as String,
      descriptions: data['descriptions'] as String,
      weather: data['weather'] as String,
    );
  }

  Future<List<String>> fetchListImage({
    required String idTour,
  }) async {
    final documentSnapshot =
        await _firebaseFirestoreTourDetails.doc(idTour).get();

    final arrayImage = documentSnapshot.data()!['imageList'];
    final imageList =
        (arrayImage as List<dynamic>).map((e) => e.toString()).toList();

    return imageList;
  }

  Future<bool> tourHasBeenMarked({
    required String idUser,
    required String idTour,
  }) async {
    final documentSnapshot = await _firebaseFirestoreBookMarks
        .where('idUser', isEqualTo: idUser)
        .where('idTour', isEqualTo: idTour)
        .get();
    if (documentSnapshot.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> handleBookmarkTour({
    required bool bookmark,
    required String idUser,
    required String idTour,
  }) async {
    if (bookmark == true) {
      final snapshot = await _firebaseFirestoreBookMarks
          .where('idUser', isEqualTo: idUser)
          .where('idTour', isEqualTo: idTour)
          .get();
      for (final document in snapshot.docs) {
        await document.reference.delete();
      }
    } else {
      await _firebaseFirestoreBookMarks.add({
        'idUser': idUser,
        'idTour': idTour,
      });
    }
  }
}
