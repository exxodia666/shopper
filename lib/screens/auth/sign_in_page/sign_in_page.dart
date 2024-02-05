import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper/cubit/auth/cubit.dart';
import 'package:shopper/repository/authentication_repository.dart';
import 'package:shopper/widgets/widgets.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (_) => SignInCubit(context.read<AuthenticationRepository>()),
      child: const SignInForm(),
    );
  }
}
