import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotour_app/core/model/tour_model.dart';

class BestPlaceRepository {
  final _firebaseFirestoreBestPlace =
      FirebaseFirestore.instance.collection('tour-details');

  // Fetch Data Best Place from the firebase
  Future<List<TourModel>> fetchDataBestPlace() async {
    final data = await _firebaseFirestoreBestPlace
        .where('hotPlace', isEqualTo: true)
        .get();

    final response = (data.docs)
        .map(
          (json) => TourModel.fromJsonOfBestPlace(json.data()),
        )
        .toList();

    return response;
  }

  // Search from the firebase
  Future<List<TourModel>> searchData({required String value}) async {
    final searchValue = value
        .toLowerCase()
        .split(' ')
        .map((e) => '${e[0].toUpperCase()}${e.substring(1)}')
        .join(' ');

    // get place name
    final getPlaceName = await _firebaseFirestoreBestPlace
        .where('placeName', isGreaterThanOrEqualTo: searchValue)
        .get();

    final placeName = (getPlaceName.docs)
        .map(
          (json) => TourModel.fromJsonOfBestPlace(json.data()),
        )
        .where(
          (element) => element.placeName.contains(searchValue),
        )
        .toList();

    // get location
    final getLocation = await _firebaseFirestoreBestPlace
        .where('location', isGreaterThanOrEqualTo: searchValue)
        .get();

    final location = (getLocation.docs)
        .map(
          (json) => TourModel.fromJsonOfBestPlace(json.data()),
        )
        .where(
          (element) => element.location.contains(searchValue),
        )
        .toList();

    // merge place name and location
    final response = {...placeName, ...location}.toSet().toList();

    return response;
  }
}
