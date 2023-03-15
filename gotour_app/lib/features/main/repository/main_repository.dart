import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotour_app/features/main/models/model_hot_place.dart';
import 'package:gotour_app/features/main/models/model_id_tour.dart';
import 'package:gotour_app/features/main/models/model_my_location.dart';

class MainRepository {
  final _firebaseFirestoreHotPlace =
      FirebaseFirestore.instance.collection('tour-details');
  final _firebaseFirestoreTourBookMarks =
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

  Future<List<IdTour>> fetchListTourBookmarkByUser({
    required String idUser,
  }) async {
    final data = await _firebaseFirestoreTourBookMarks
        .where('idUser', isEqualTo: idUser)
        .get();
    return (data.docs)
        .map((tour) => IdTour(idTour: tour['idTour'] as String))
        .toList();
  }

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
}
