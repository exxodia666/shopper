import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:shopper/models/user/user.dart';
import 'authentication_api.dart';
import 'errors.dart';

class AuthenticationFirebaseApi extends AuthenticationApi {
  final firebase_auth.FirebaseAuth _firebaseAuth =
      firebase_auth.FirebaseAuth.instance;
  @override
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      return user;
    });
  }

  @override
  User get currentUser {
    return User.empty;
  }

  @override
  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (err) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

extension on firebase_auth.User {
  /// Maps a [firebase_auth.User] into a [User].
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}
