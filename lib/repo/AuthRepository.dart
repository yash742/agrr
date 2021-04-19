class AuthRepository {
  Future<void> signIn() async {
    await Future.delayed(Duration(seconds: 3));
    throw Exception("logIn failed try ");
  }
}
