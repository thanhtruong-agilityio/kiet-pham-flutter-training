class BookmarkTour {
  BookmarkTour({
    required this.tourId,
    required this.userId,
  });

  factory BookmarkTour.fromJson(Map<String, dynamic> json) => BookmarkTour(
        tourId: json['tourId'] as String,
        userId: json['userId'] as String,
      );

  String tourId;
  String userId;

  Map<String, dynamic> toJson() => {
        'tourId': tourId,
        'idUser': userId,
      };
}
