class TourId {
  TourId({
    required this.tourId,
  });

  factory TourId.fromJson(Map<String, dynamic> json) => TourId(
        tourId: json['tourId'] as String,
      );

  // String id;
  String tourId;

  Map<String, dynamic> toJson() => {
        'tourId': tourId,
      };
}
