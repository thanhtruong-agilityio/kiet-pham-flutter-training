class HotPlace {
  HotPlace({
    // required this.id,
    required this.imageUrl,
    required this.location,
    required this.placeName,
    required this.price,
  });

  factory HotPlace.fromJson(Map<String, dynamic> json) => HotPlace(
        // id: json['id'] as String,
        imageUrl: json['imageUrl'] as String,
        location: json['location'] as String,
        placeName: json['placeName'] as String,
        price: json['price'] as String,
      );

  // String id;
  String imageUrl;
  String location;
  String placeName;
  String price;

  Map<String, dynamic> toJson() => {
        'price': price,
        'imageUrl': imageUrl,
        'location': location,
        'placeName': placeName,
      };
}
