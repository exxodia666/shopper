import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopper/app/app.dart';
import 'package:shopper/firebase_options.dart';

import 'api/auth/authentication_firebase_api.dart';
import './repository/authentication_repository.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authFirebaseApi = AuthenticationFirebaseApi();
  final authenticationRepository = AuthenticationRepository(authApi: authFirebaseApi);

  await authenticationRepository.user.first;

  runApp(MyApp(authenticationRepository: authenticationRepository));
}
