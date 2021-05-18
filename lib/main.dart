import 'package:agr_/agape/agapeView.dart';
import 'package:agr_/authentication/otherScreen/signUp/AgrSignUpView.dart';
import 'package:agr_/authentication/signIn/AgrSignInView.dart';
import 'package:agr_/cubit/agrAppCubit.dart';
import 'package:agr_/cubit/agrAuthCubit.dart';
import 'package:agr_/flower/agrFlowerView.dart';
import 'package:agr_/navigator/AgrSessionNavigator.dart';
import 'package:agr_/navigator/agrAuthNavigator.dart';
import 'package:agr_/payee.dart';
import 'package:agr_/repo/AuthRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            Payee() /* RepositoryProvider(
        create: (context) => AuthRepository(),
        child: BlocProvider(
            create: (context) => AgrSessionCubit(),
            child: AgrSessionNavigator()),
      ),*/
        );
  }
}
