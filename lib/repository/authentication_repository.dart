import 'dart:async';
import 'package:shopper/api/auth/authentication_api.dart';
import 'package:shopper/models/user/user.dart';

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
    await _authApi.signUpWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _authApi.logInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logOut() async {
    await _authApi.logOut();
  }
}
