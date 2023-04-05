class MyLocation {
  MyLocation({
    required this.id,
    required this.imageUrl,
    this.descriptions = '',
    this.location = '',
    this.placeName = '',
  });

  factory MyLocation.fromJson(Map<String, dynamic> json) => MyLocation(
        id: json['id'] as String,
        descriptions: json['descriptions'] as String,
        imageUrl: json['imageUrl'] as String,
        location: json['location'] as String,
        placeName: json['placeName'] as String,
      );
  String id;
  String descriptions;
  String imageUrl;
  String location;
  String placeName;

  Map<String, dynamic> toJson() => {
        'id': id,
        'descriptions': descriptions,
        'imageUrl': imageUrl,
        'location': location,
        'placeName': placeName,
      };
}
