class BookmarkTour {
  BookmarkTour({
    required this.idTour,
    required this.idUser,
  });

  factory BookmarkTour.fromJson(Map<String, dynamic> json) => BookmarkTour(
        idTour: json['idTour'] as String,
        idUser: json['idUser'] as String,
      );

  String idTour;
  String idUser;

  Map<String, dynamic> toJson() => {
        'idTour': idTour,
        'idUser': idUser,
      };
}
