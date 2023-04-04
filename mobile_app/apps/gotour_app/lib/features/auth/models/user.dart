import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageUrl,
    required this.gender,
  });

  factory UserEntity.empty() => const UserEntity(
        firstName: '',
        lastName: '',
        email: '',
        imageUrl: '',
        gender: '',
      );

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      firstName: json['firstName'] != null ? json['firstName'] as String : '',
      lastName: json['lastName'] != null ? json['lastName'] as String : '',
      email: json['email'] != null ? json['email'] as String : '',
      imageUrl: json['imageUrl'] != null ? json['imageUrl'] as String : '',
      gender: json['gender'] != null ? json['gender'] as String : '',
    );
  }

  final String firstName;
  final String lastName;
  final String email;
  final String imageUrl;
  final String gender;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'imageUrl': imageUrl,
        'gender': gender,
      };

  @override
  List<Object?> get props => [firstName, lastName, email, imageUrl, gender];
}
