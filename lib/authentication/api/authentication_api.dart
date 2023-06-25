import 'package:shopper/authentication/authentication.dart';

abstract class AuthenticationApi {
  AuthenticationApi();

  Stream<User> get user;

  User get currentUser;

  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password});

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> logOut();
}
