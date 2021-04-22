part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

//start pas app baru dibuka
class AppLoaded extends AuthEvent {}

//event dipakai saat user berhasil login
class UserLoggedIn extends AuthEvent {
  final User user;

  UserLoggedIn(this.user);

  @override
  List<Object> get props => [user];
}

class UserLoggedOut extends AuthEvent {}
