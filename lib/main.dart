import 'package:agr_/agape/agapeView.dart';
import 'package:agr_/authentication/otherScreen/signUp/AgrSignUpView.dart';
import 'package:agr_/authentication/signIn/AgrSignInView.dart';
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
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: AgapeView(),
      ),
    );
  }
}
