part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;

  User({this.id, this.name, this.email, this.phoneNumber, this.address});
  @override
  // TODO: implement props
  List<Object> get props => [id, name, email, phoneNumber, address];
}

User mockUser = User(
  id: 1,
  name: 'Wahyu Alfandi',
  address: 'Jl. Palapa II',
  phoneNumber: '012345678',
  email: 'wahyu@gmail.com',
);
