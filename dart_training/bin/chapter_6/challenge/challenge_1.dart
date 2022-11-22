class Student {
  /// Create a Student class with final firstName and lastName String properties and a variable grade as an int property.
  /// Add a constructor to the class that initializes all the properties.
  /// Add a method to the class that nicely formats a Student for printing.
  /// Use the class to create students bert and ernie with grades of 95 and 85, respectively.

  final String firstName;
  final String lastName;
  int grade;

  Student({this.firstName = '', this.lastName = '', this.grade = 1});

  @override
  String toString() {
    return 'Student{"first name": $firstName, "last name": $lastName, "grade": $grade}';
  }
}

void main(List<String> args) {
  var stdBert = Student(firstName: 'Bert', grade: 95);
  var stdErnie = Student(firstName: 'Ernie', grade: 85);
  print(stdBert);
  print(stdErnie);
}
