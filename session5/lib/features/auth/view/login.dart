import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final auth = context.read<AuthCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("تسجيل دخول"),
                const SizedBox(height: 40),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ForgetPassword(),
                      //   ),
                      // );
                    },
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: GoogleFonts.cairo(color: const Color(0Xff2d9f5d)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text('تسجيل دخول'),
                  onPressed: () async {
                    //   await auth.login(
                    //     emailController.text.trim(),
                    //     passwordController.text.trim(),
                    //   );
                    //   if (auth.state is! Authenticated) {
                    //     ScaffoldMessenger.of(
                    //       context,
                    //     ).showSnackBar(
                    //         const SnackBar(content: Text("Invalid data")));
                    //   }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
