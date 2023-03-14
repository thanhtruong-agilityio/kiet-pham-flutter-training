import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotour_app/features/main/models/model_hot_place.dart';
import 'package:gotour_app/features/main/models/model_my_location.dart';

class MainRepository {
  final _firebaseFirestoreHotPlace =
      FirebaseFirestore.instance.collection('tour-details');
  final _firebaseFirestoreMyLocation =
      FirebaseFirestore.instance.collection('book-marks');

  Future<List<HotPlace>> fetchDataHotPlace() async {
    final data = await _firebaseFirestoreHotPlace
        .where('hotPlace', isEqualTo: true)
        .get();
    return (data.docs)
        .map(
          (tour) => HotPlace(
            imageUrl: tour['imageUrl'] as String,
            location: tour['location'] as String,
            placeName: tour['placeName'] as String,
            price: tour['price'] as String,
          ),
        )
        .toList();
  }
}
