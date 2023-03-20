import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotour_app/features/main/my_location/model/model_id_tour.dart';
import 'package:gotour_app/features/main/my_location/model/model_my_location.dart';

class MyLocationRepository {
  final _firebaseFirestoreTourBookMarks =
      FirebaseFirestore.instance.collection('book-marks');

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
