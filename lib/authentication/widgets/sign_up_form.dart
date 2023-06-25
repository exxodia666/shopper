import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:shopper/authentication/authentication.dart';
import 'package:shopper/src/theme/colors.dart';
import 'package:shopper/src/theme/fonts.dart';
import 'package:shopper/src/widgets/button/button.dart';
import 'package:shopper/src/widgets/text_input/text_input.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leadingWidth: 60,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back,
              color: CustomColors.black,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(
                flex: 2,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 44.0),
                child: Text(
                  'Sign in Shopper',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: Fonts.semibold,
                      color: CustomColors.black),
                ),
              ),
              _EmailInput(),
              _PasswordInput(),
              _ConfirmPasswordInput(),
              _SignUpButton(),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextInput(
          icon: const Icon(Icons.person),
          placeholder: 'Email',
          key: const Key('signUpForm_emailInput_textField'),
          onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
          // keyboardType: TextInputType.emailAddress,
          errorText: state.email.displayError != null ? 'invalid email' : null,
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextInput(
          icon: const Icon(Icons.lock),
          placeholder: 'Password',
          key: const Key('signUpForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<SignUpCubit>().passwordChanged(password),
          obscureText: true,
          errorText:
              state.password.displayError != null ? 'invalid password' : null,
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return TextInput(
          icon: const Icon(Icons.lock),
          placeholder: 'Confirmation',
          key: const Key('signUpForm_confirmedPasswordInput_textField'),
          onChanged: (confirmPassword) => context
              .read<SignUpCubit>()
              .confirmedPasswordChanged(confirmPassword),
          obscureText: true,
          errorText: state.confirmedPassword.displayError != null
              ? 'passwords do not match'
              : null,
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : Button(
          title: 'Sign Up',
          color: CustomColors.primary,
          textColor: CustomColors.white,
          onPress: () {
            context.read<SignUpCubit>().signUpFormSubmitted();
          },
        );
      },
    );
  }
}
