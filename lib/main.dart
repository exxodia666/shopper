import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopper/app/app.dart';
import 'package:shopper/firebase_options.dart';
import 'package:shopper/repository/product_repository.dart';

import 'api/auth/authentication_firebase_api.dart';
import './repository/authentication_repository.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  //   print('${bloc.runtimeType} $transition');
  // }

  // @override
  // void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
  //   print('${bloc.runtimeType} $error $stackTrace');
  //   super.onError(bloc, error, stackTrace);
  // }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authFirebaseApi = AuthenticationFirebaseApi();
  final authenticationRepository =
      AuthenticationRepository(authApi: authFirebaseApi);

  final productRepository = ProductRepository();

  await authenticationRepository.user.first;

  Bloc.observer = SimpleBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  runApp(MyApp(
    authenticationRepository: authenticationRepository,
    productRepository: productRepository,
  ));
}
