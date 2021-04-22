import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/bloc/bloc.dart';
import 'package:inventory_app/cubit/asset_cubit.dart';
import 'package:inventory_app/cubit/user_cubit.dart';
import 'package:inventory_app/shared/shared.dart';
import './ui/pages/pages.dart';
import 'package:get/get.dart';

void main() => runApp(
      BlocProvider(
        create: (context) {
          return AuthBloc()..add(AppLoaded());
        },
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => AssetCubit())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return MainPage();
            }
            if (state is Unauthenticated) {
              return LoginPage();
            }
            return Container(color: Colors.white, child: loadingIndicator);
          },
        ),
      ),
    );
  }
}
