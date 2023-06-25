import 'dart:async';
import 'package:shopper/authentication/api/authentication_api.dart';
import 'package:shopper/authentication/models/user.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    required AuthenticationApi authApi,
  }) : _authApi = authApi;

  final AuthenticationApi _authApi;

  Stream<User> get user {
    return _authApi.user;
  }

  User get currentUser {
    return _authApi.currentUser;
  }

  Future<void> signUp({required String email, required String password}) async {
    _authApi.signUpWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    _authApi.logInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logOut() async {
    _authApi.logOut();
  }
}
