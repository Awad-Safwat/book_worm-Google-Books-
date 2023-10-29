import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/auth/presentation/manager/sign_in-cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              if (state is SignInFaluer) {
                //print(state.massage);
                return const Center(
                  child: Text('errroooooorrrrrr'),
                );
              } else if (state is SignInSuccess) {
                // print(getAccessToken());
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.userData.userName),
                      Text(state.userData.email),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}

//ya29.a0AfB_byDULqoarX4tzTC13e_YUirte43sd6g8tN9VUKoDuaK6XEiEbJZhFDrwRTkvRcFva2jFWAtlbBCUsMMw6DTcoTOh00f1KCRXazoZzNqJ9jiUnhmNmjTjZs13m7R3dW3gpFDvBul-AvLc-HFxkvGqfB7yCqZPZkIaCgYKAT0SARESFQGOcNnCOXtWCbuRgAlubQ3uzYovcg0170
//ya29.a0AfB_byDULqoarX4tzTC13e_YUirte43sd6g8tN9VUKoDuaK6XEiEbJZhFDrwRTkvRcFva2jFWAtlbBCUsMMw6DTcoTOh00f1KCRXazoZzNqJ9jiUnhmNmjTjZs13m7R3dW3gpFDvBul-AvLc-HFxkvGqfB7yCqZPZkIaCgYKAT0SARESFQGOcNnCOXtWCbuRgAlubQ3uzYovcg0170