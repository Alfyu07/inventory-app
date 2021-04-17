import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_app/models/models.dart';
import 'package:inventory_app/services/services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppLoaded) {
      yield AuthLoading();

      try {
        //ambil token dari shared preferences
        String token = await UserServices.getToken();

        //jika token tidak null
        if (token != null) {
          //set token jadi milik user
          User.token = token;
          final ApiReturnValue<User> result =
              await UserServices.getCurrentUser();

          if (result.value != null) {
            yield Authenticated(user: result.value);
          } else {
            yield Unauthenticated();
          }
        } else {
          yield Unauthenticated();
        }
      } catch (e) {
        yield AuthFailure(e.message ?? 'An unknown error occurred');
      }
    }

    if (event is UserLoggedIn) {
      yield Authenticated(user: event.user);
    }

    if (event is UserLoggedOut) {
      try {
        final ApiReturnValue<String> result = await UserServices.signOut();
        if (result.value != null) {
          yield Unauthenticated();
        } else {
          return;
        }
      } catch (e) {
        yield AuthFailure(e.message ?? 'An unknown error occurred');
      }
    }
  }
}
