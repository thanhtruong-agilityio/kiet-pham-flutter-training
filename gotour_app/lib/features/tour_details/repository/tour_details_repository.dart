import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotour_app/features/tour_details/model/model_tour_details.dart';

class TourDetailsRepository {
  final _firebaseFirestoreTourDetails =
      FirebaseFirestore.instance.collection('tour-details');

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
}
