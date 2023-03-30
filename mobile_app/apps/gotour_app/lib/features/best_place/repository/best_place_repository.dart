import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotour_app/features/best_place/model/best_place.dart';

class BestPlaceRepository {
  final _firebaseFirestoreBestPlace =
      FirebaseFirestore.instance.collection('tour-details');

  // Fetch Data Best Place from the firebase
  Future<List<BestPlace>> fetchDataBestPlace() async {
    final data = await _firebaseFirestoreBestPlace
        .where('hotPlace', isEqualTo: true)
        .get();

    final response = (data.docs)
        .map(
          (tour) => BestPlace(
            id: tour['id'] as String,
            imageUrl: tour['imageUrl'] as String,
            location: tour['location'] as String,
            placeName: tour['placeName'] as String,
            price: tour['price'] as String,
            tagList: List<String>.from(tour['tagList'] as List),
          ),
        )
        .toList();

    return response;
  }
}
