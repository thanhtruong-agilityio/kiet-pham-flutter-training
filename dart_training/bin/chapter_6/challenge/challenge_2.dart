class Sphere {
  // volume = (4 / 3) * pi * (_darius * _darius * _darius);
  // surfaceArea = 4 * pi * (darius * darius);

  double darius;
  static const double pi = 3.1415926;

  Sphere(this.darius);

  String sphereVolume() {
    return 'volume sphere = ${(4 / 3) * pi * (darius * darius * darius)}';
  }

  String surfaceArea() {
    return 'surface area sphere = ${4 * pi * (darius * darius)}';
  }
}

void main(List<String> args) {
  var darius = Sphere(12);
  print(darius.sphereVolume());
}
