import 'package:flutter/cupertino.dart';

class AuthRepository {
  Future<void> signIn({
    @required String useremail,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 3));

    throw Exception("logIn failed try ");
  }

  Future<void> signup({
    @required String userName,
    @required String useremail,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 3));

    throw Exception("logIn failed try ");
  }
}
