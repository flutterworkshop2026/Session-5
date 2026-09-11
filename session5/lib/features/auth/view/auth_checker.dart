// import 'package:flutter/material.dart';
//
// class AuthChecker extends StatefulWidget {
//   const AuthChecker({super.key});
//
//   @override
//   State<AuthChecker> createState() => _AuthCheckerState();
// }
//
// class _AuthCheckerState extends State<AuthChecker> {
//   @override
//   Widget build(BuildContext context) {
//     // return auth.state is Authenticated ? const HomePage() : LoginScreen();
//     return BlocBuilder<AuthCubit, AuthState>(
//       builder: (context, state) {
//         if (state is Authenticated) return const HomePage();
//         return LoginScreen();
//       },
//     );
//   }
// }
