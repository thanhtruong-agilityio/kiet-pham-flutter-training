class IdTour {
  IdTour({
    required this.idTour,
  });

  factory IdTour.fromJson(Map<String, dynamic> json) => IdTour(
        idTour: json['idTour'] as String,
      );

  // String id;
  String idTour;

  Map<String, dynamic> toJson() => {
        'idTour': idTour,
      };
}
