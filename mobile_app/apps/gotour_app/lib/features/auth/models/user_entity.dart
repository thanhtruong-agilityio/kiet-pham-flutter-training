import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.email,
    required this.gender,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: '',
      email: json['email'] != null ? json['email'] as String : '',
      gender: json['gender'] != null ? json['gender'] as int : 0,
    );
  }

  final String id;
  final String email;
  final int gender;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'gender': gender,
      };

  @override
  List<Object?> get props => [id, email, gender];
}
