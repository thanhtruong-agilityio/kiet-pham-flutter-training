class MyLocation {
  MyLocation({
    // required this.id,
    required this.descriptions,
    required this.imageUrl,
    required this.location,
    required this.placeName,
  });

  factory MyLocation.fromJson(Map<String, dynamic> json) => MyLocation(
        // id: json['id'] as String,
        descriptions: json['descriptions'] as String,
        imageUrl: json['imageUrl'] as String,
        location: json['location'] as String,
        placeName: json['placeName'] as String,
      );
  // String id;
  String descriptions;
  String imageUrl;
  String location;
  String placeName;

  Map<String, dynamic> toJson() => {
        'descriptions': descriptions,
        'imageUrl': imageUrl,
        'location': location,
        'placeName': placeName,
      };
}

// class MyLocation {
//   MyLocation({
//     required this.idTour,
//     required this.idUser,
//   });

//   factory MyLocation.fromJson(Map<String, dynamic> json) => MyLocation(
//         idTour: json['idTour'] as String,
//         idUser: json['idUser'] as String,
//       );

//   String idTour;
//   String idUser;

//   Map<String, dynamic> toJson() => {
//         'idTour': idTour,
//         'idUser': idUser,
//       };
// }
