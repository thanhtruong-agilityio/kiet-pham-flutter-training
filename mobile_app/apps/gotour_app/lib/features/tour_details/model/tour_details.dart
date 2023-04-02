class TourDetails {
  TourDetails({
    required this.descriptions,
    required this.id,
    required this.imageUrl,
    required this.location,
    required this.placeName,
    required this.price,
    required this.weather,
    required this.imageList,
  });

  factory TourDetails.fromJson(Map<String, dynamic> json) => TourDetails(
        descriptions: json['descriptions'] as String,
        id: json['id'] as String,
        imageUrl: json['imageUrl'] as String,
        location: json['location'] as String,
        placeName: json['placeName'] as String,
        price: json['price'] as String,
        weather: json['weather'] as String,
        imageList: json['imageList'] as List<String>,
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
