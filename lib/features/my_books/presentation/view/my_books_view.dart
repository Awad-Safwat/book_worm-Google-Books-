import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/auth/data/repo_imple/auth_repo_imple.dart';
import 'package:book_worm/features/auth/presentation/manager/sign_in-cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyBooksView extends StatefulWidget {
  const MyBooksView({super.key});

  @override
  State<MyBooksView> createState() => _MyBooksViewState();
}

class _MyBooksViewState extends State<MyBooksView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Hello'),
          const SizedBox(
            height: 50,
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                //  access = canAccess;
              });
            },
            color: Colors.blue,
            child: const Text('Can Access?'),
          ),
        ],
      ),
    );
  }
}
