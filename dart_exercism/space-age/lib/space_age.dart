class SpaceAge {
  // Put your code here

  Map<String, double> PlanetAge = {
    'Mercury': 0.2408467,
    'Venus': 0.61519726,
    'Earth': 1.0,
    'Mars': 1.8808158,
    'Jupiter': 11.862615,
    'Saturn': 29.447498,
    'Uranus': 84.016846,
    'Neptune': 164.79132
  };

  double age({String? planet, int? seconds}) {
    var result = seconds! / 31557600 / PlanetAge[planet]!;
    return double.parse(result.toStringAsFixed(2));
  }
}
