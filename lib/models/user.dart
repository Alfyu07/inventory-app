part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  static String token;

  User({this.id, this.name, this.email, this.phoneNumber, this.address});

  User copyWith({
    int id,
    String name,
    String email,
    String phoneNumber,
    String address,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
      );

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        phoneNumber: data['phoneNumber'],
        address: data['address'],
      );

  @override
  List<Object> get props => [id, name, email, phoneNumber, address];
}
