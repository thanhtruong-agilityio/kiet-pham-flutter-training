import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotour_app/features/main/best_place/model/model_best_place.dart';

class BestPlaceRepository {
  final _firebaseFirestoreBestPlace =
      FirebaseFirestore.instance.collection('tour-details');
  Future<List<BestPlace>> fetchDataBestPlace() async {
    final data = await _firebaseFirestoreBestPlace
        .where('hotPlace', isEqualTo: true)
        .get();
    return (data.docs)
        .map(
          (tour) => BestPlace(
            imageUrl: tour['imageUrl'] as String,
            location: tour['location'] as String,
            placeName: tour['placeName'] as String,
            price: tour['price'] as String,
          ),
        )
        .toList();
  }
}
