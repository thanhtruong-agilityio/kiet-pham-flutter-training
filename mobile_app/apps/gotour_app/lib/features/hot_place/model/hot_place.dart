class HotPlace {
  HotPlace({
    required this.id,
    required this.imageUrl,
    required this.location,
    required this.placeName,
    required this.price,
    required this.tagList,
    required this.imageList,
  });

  factory HotPlace.fromJson(Map<String, dynamic> json) => HotPlace(
        id: json['id'] as String,
        imageUrl: json['imageUrl'] as String,
        location: json['location'] as String,
        placeName: json['placeName'] as String,
        price: json['price'] as String,
        tagList: List<String>.from(json['tagList'] as List),
        imageList: List<String>.from(json['imageList'] as List),
      );

  String id;
  String imageUrl;
  String location;
  String placeName;
  String price;
  List<String> tagList;
  List<String> imageList;
}
