import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper/authentication/cubit/sign_in_cubit.dart';
import 'package:shopper/authentication/repository/authentication_repository.dart';
import 'package:shopper/authentication/widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  // static Page<void> page() => const MaterialPage<void>(child: SignInPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => SignInCubit(context.read<AuthenticationRepository>()),
          child: const SignInForm(),
        ),
      ),
    );
  }
}
