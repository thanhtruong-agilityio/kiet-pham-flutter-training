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
        tagList: json['tagList'] as List<String>,
        imageList: json['imageList'] as List<String>,
      );

  String id;
  String imageUrl;
  String location;
  String placeName;
  String price;
  List<String> tagList;
  List<String> imageList;
}
