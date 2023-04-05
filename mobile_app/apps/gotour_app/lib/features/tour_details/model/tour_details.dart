class TourDetails {
  TourDetails({
    required this.id,
    required this.location,
    required this.placeName,
    this.descriptions = '',
    this.imageUrl = '',
    this.price = '',
    this.weather = '',
    this.imageList = const [],
  });

  factory TourDetails.fromJson(Map<String, dynamic> json) => TourDetails(
        descriptions: json['descriptions'] as String,
        id: json['id'] as String,
        imageUrl: json['imageUrl'] as String,
        location: json['location'] as String,
        placeName: json['placeName'] as String,
        price: json['price'] as String,
        weather: json['weather'] as String,
        imageList: List<String>.from(json['imageList'] as List),
      );

  String descriptions;
  String id;
  String imageUrl;
  String location;
  String placeName;
  String price;
  String weather;
  List<String> imageList;

  Map<String, dynamic> toJson() => {
        'descriptions': descriptions,
        'id': id,
        'imageUrl': imageUrl,
        'location': location,
        'placeName': placeName,
        'price': price,
        'weather': weather,
      };
}
