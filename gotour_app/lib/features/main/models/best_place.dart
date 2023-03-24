class BestPlace {
  BestPlace({
    required this.id,
    required this.imageUrl,
    required this.location,
    required this.placeName,
    required this.price,
  });

  factory BestPlace.fromJson(Map<String, dynamic> json) => BestPlace(
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
  String price;

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'imageUrl': imageUrl,
        'location': location,
        'placeName': placeName,
      };
}
