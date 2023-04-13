class TourModel {
  TourModel({
    required this.id,
    required this.imageUrl,
    required this.placeName,
    required this.location,
    this.descriptions = '',
    this.hotPlace = false,
    this.price = '',
    this.weather = '',
    this.tagList = const [],
    this.imageList = const [],
  });

  factory TourModel.fromJsonOfBestPlace(Map<String, dynamic> json) => TourModel(
        id: json['id'] as String,
        imageUrl: json['imageUrl'] as String,
        location: json['location'] as String,
        placeName: json['placeName'] as String,
        price: json['price'] as String,
      );

  String id;
  String imageUrl;
  String location;
  String placeName;
  String descriptions;
  bool hotPlace;
  String price;
  String weather;
  List<String> tagList;
  List<String> imageList;

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageUrl': imageUrl,
        'placeName': placeName,
        'location': location,
        'descriptions': descriptions,
        'hotPlace': hotPlace,
        'price': price,
        'weather': weather,
        'tagList': tagList,
        'imageList': imageList,
      };
}
