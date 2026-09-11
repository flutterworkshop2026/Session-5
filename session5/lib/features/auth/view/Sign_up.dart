import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    // final auth = context.watch<AuthCubit>();
    bool showPassword = false;
    bool isAgreed = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('حساب جديد'),
              const SizedBox(height: 40),

              TextFormField(
                controller: nameController,
                obscureText: false,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: emailController,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              Builder(
                builder: (context) {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: !showPassword,
                    keyboardType: TextInputType.visiblePassword,
                  );
                },
              ),
              const SizedBox(height: 5),
              Builder(
                builder: (ctx) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: isAgreed,
                            onChanged: (value) {
                              isAgreed = value!;
                              (ctx as Element).markNeedsBuild();
                            },
                            activeColor: Colors.green,
                          ),
                          Text(
                            'موافقة على الشروط والتحكم الخاصة بنا',
                            style: GoogleFonts.cairo(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: isAgreed
                            ? () {
                                // auth.signUp(
                                //   nameController.text.trim(),
                                //   emailController.text.trim(),
                                //   passwordController.text.trim(),
                                // );
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => LoginScreen(),
                                //   ),
                                // );
                              }
                            : null,
                        child: const Text('إنشاء حساب جديد'),
                      ),
                    ],
                  );
                },
              ),

              // Builder(
              //   builder: (context) {
              //     return Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Checkbox(
              //           value: isAgreed,
              //             onChanged: (value) {
              //             {
              //               isAgreed = value!;
              //               (context as Element ).markNeedsBuild();
              //             };
              //           },
              //           activeColor: Colors.blue,
              //         ),
              //         const Text(
              //           'موافقة على الشروط والتحكم الخاصة بنا',
              //           style: TextStyle(fontSize: 14),
              //         ),
              //       ],
              //     );
              //   }
              // ),
              // Builder(
              //   builder: (ctx) {
              //     return SizedBox(
              //       width: double.infinity,
              //       child: ElevatedButton(
              //         onPressed:   isAgreed ? (){
              //
              //
              //         }:null,
              //
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: const Color(0XFFFF1B5E37),
              //           padding: const EdgeInsets.symmetric(vertical: 16),
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(12),
              //           ),
              //         ),
              //         child: const Text(
              //            'إنشاء حساب جديد',
              //           style: TextStyle(color: Color(0XFFFFFFFFF),fontSize: 18),
              //         ),
              //
              //
              //       ),
              //     );
              //   }
              //
              // ),
              const SizedBox(height: 20),
              TextButton(
                child: const Text("Login"),
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
