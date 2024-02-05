import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper/cubit/auth/sign_up/sign_up_cubit.dart';
import 'package:shopper/repository/authentication_repository.dart';
import 'package:shopper/widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (_) => SignUpCubit(context.read<AuthenticationRepository>()),
      child: const SignUpForm(),
    );
  }
}
