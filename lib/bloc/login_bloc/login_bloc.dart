import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:inventory_app/models/models.dart';
import 'package:inventory_app/services/services.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthBloc authBloc;
  LoginBloc(this.authBloc)
      : assert(authBloc != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        ApiReturnValue<User> result =
            await UserServices.signIn(event.email, event.password);
        if (result.value != null) {
          authBloc.add(UserLoggedIn(result.value));
          yield LoginSuccess();
          yield LoginInitial();
        } else {
          yield LoginFailure(error: result.message);
        }
      } on Exception catch (err) {
        yield LoginFailure(error: err ?? 'An unknown error occured');
      } catch (e) {
        yield LoginFailure(error: e.message);
      }
    }
  }
}
