import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/navigation/main_navigator.dart';
import 'package:shopper/repository/favorite_repository.dart';
import 'package:shopper/repository/product_repository.dart';
import 'package:shopper/repository/authentication_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key,
      required favoriteRepository,
      required authenticationRepository,
      required productRepository})
      : _authenticationRepository = authenticationRepository,
        _productRepository = productRepository,
        _favoriteRepository = favoriteRepository;

  final AuthenticationRepository _authenticationRepository;
  final ProductRepository _productRepository;
  final FavoriteRepository _favoriteRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>.value(
          value: _authenticationRepository,
        ),
        RepositoryProvider<ProductRepository>.value(value: _productRepository),
        RepositoryProvider<FavoriteRepository>.value(value: _favoriteRepository)
      ],
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const MainNavigator(),
      ),
    );
  }
}
