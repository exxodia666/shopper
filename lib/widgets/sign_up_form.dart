import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:shopper/cubit/auth/sign_up/sign_up_cubit.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/typography.dart';
import 'package:shopper/widgets/widgets.dart';

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
              SnackBar(
                  content: TypographyCustom.regular(
                      text: state.errorMessage ?? 'Sign Up Failure',
                      color: CustomColors.red)),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 44.0),
                child: TypographyCustom.semiBold(
                    text: AppLocalizations.of(context)!.auth_sign_up_title,
                    fontSize: 20.0,
                    color: CustomColors.black),
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
          placeholder: AppLocalizations.of(context)!.auth_email,
          key: const Key('signUpForm_emailInput_textField'),
          onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
          // keyboardType: TextInputType.emailAddress,
          errorText: state.email.displayError != null
              ? AppLocalizations.of(context)!.auth_email_error
              : null,
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
          placeholder: AppLocalizations.of(context)!.auth_password,
          key: const Key('signUpForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<SignUpCubit>().passwordChanged(password),
          obscureText: true,
          errorText: state.password.displayError != null
              ? AppLocalizations.of(context)!.auth_password_error
              : null,
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
          placeholder: AppLocalizations.of(context)!.auth_confirmation,
          key: const Key('signUpForm_confirmedPasswordInput_textField'),
          onChanged: (confirmPassword) => context
              .read<SignUpCubit>()
              .confirmedPasswordChanged(confirmPassword),
          obscureText: true,
          errorText: state.confirmedPassword.displayError != null
              ? AppLocalizations.of(context)!.auth_confirmation_error
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
                title: AppLocalizations.of(context)!.auth_sign_up_btn,
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
