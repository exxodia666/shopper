import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/navigation/routes.dart';
import 'package:shopper/theme/typography.dart';
import 'package:shopper/widgets/widgets.dart';
import 'package:shopper/cubit/auth/cubit.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: TypographyCustom.regular(
                      text: state.errorMessage ?? 'Authentication Failure',
                      color: CustomColors.red),
                ),
              );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              const SizedBox(
                width: 76.0,
                height: 76.0,
              ),
              const Spacer(
                flex: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 44.0),
                child: TypographyCustom.semiBold(
                  text: 'Login to Shopper',
                  fontSize: 20.0,
                  color: CustomColors.black,
                ),
              ),
              _EmailInput(),
              _PasswordInput(),
              _LoginButton(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: CustomColors.lightGrey,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: TypographyCustom.regular(
                            text: 'Or',
                            fontSize: 14.0,
                            color: CustomColors.lightGrey),
                      ),
                      const Expanded(
                        child: Divider(
                          color: CustomColors.lightGrey,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  children: [
                    const Spacer(),
                    TypographyCustom.medium(
                        text: 'Don’t have an account? ',
                        fontSize: 14.0,
                        color: CustomColors.lightGrey),
                    InkWell(
                        onTap: () {
                          navigateTo(context, Routes.signUp);
                        },
                        child: TypographyCustom.medium(
                            text: 'Sign Up',
                            fontSize: 14.0,
                            color: CustomColors.primary)),
                    const Spacer(),
                  ],
                ),
              ),
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
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextInput(
          icon: const Icon(Icons.person),
          placeholder: 'Email',
          key: const Key('SignInForm_emailInput_textField'),
          onChanged: (email) => context.read<SignInCubit>().emailChanged(email),
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
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextInput(
          obscureText: true,
          icon: const Icon(Icons.lock),
          placeholder: 'Password',
          key: const Key('SignInForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<SignInCubit>().passwordChanged(password),
          // keyboardType: TextInputType.emailAddress,
          errorText:
              state.email.displayError != null ? 'invalid password' : null,
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : Button(
                key: const Key('SignInForm_continue_raisedButton'),
                title: 'Login',
                color: CustomColors.primary,
                textColor: CustomColors.white,
                onPress: () {
                  if (state.isValid) {
                    context.read<SignInCubit>().logInWithCredentials();
                  }
                },
              );
      },
    );
  }
}
