import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper/app/bloc/app_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Avatar(photo: user.photo),
          const SizedBox(height: 4),
          Text(user.email ?? '', style: textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(user.name ?? '', style: textTheme.headlineSmall),
        ],
      ),
    );
  }
}
