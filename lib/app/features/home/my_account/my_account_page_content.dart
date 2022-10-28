import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/app/cubit/root_cubit.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      //usuwanie firebase wylogawnie nie trzeba dodawać bloc provider ani builder bo mamy globalny cubit
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Jesteś zalogowany jako $email'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context
                  .read<RootCubit>()
                  .signOut(); // odwołanie się do cubita do event signOut
            },
            child: const Text('Wyloguj'),
          ),
        ],
      ),
    );
  }
}
