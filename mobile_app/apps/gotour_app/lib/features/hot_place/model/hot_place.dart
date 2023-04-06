class HotPlace {
  HotPlace({
    required this.id,
    required this.location,
    required this.placeName,
    this.imageUrl = '',
    this.price = '',
    this.tagList = const [],
    this.imageList = const [],
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageUrl': imageUrl,
        'location': location,
        'placeName': placeName,
        'price': price,
        'tagList': tagList,
        'imageList': imageList,
      };
}
