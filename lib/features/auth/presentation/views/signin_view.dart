import 'package:book_worm/features/auth/presentation/manager/sign_in-cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              if (state is SignInFaluer) {
                print(state.massage);
                return const Center(
                  child: Text('errroooooorrrrrr'),
                );
              } else if (state is SignInSuccess) {
                return Center(
                  child: Column(
                    children: [
                      Text(state.userData.userName),
                      Text(state.userData.email),
                    ],
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
