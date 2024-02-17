import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopper/app/app.dart';
import 'package:shopper/firebase_options.dart';
import 'package:shopper/repository/cart_repository.dart';
import 'package:shopper/repository/favorite_repository.dart';
import 'package:shopper/repository/order_repository.dart';
import 'package:shopper/repository/product_repository.dart';

import 'api/auth/authentication_firebase_api.dart';
import './repository/authentication_repository.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // print('$change');
  }
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
  final favoriteRepository = FavoriteRepository();
  final cartRepository = CartRepository();
  final orderRepository = OrderRepository();
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
    favoriteRepository: favoriteRepository,
    cartRepository: cartRepository,
    orderRepository: orderRepository,
  ));
}
