import 'package:cook_book_ai/app/core/constants/color_constant.dart';
import 'package:cook_book_ai/app/features/auth/login_screen.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController fullNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController retypePasswordController = TextEditingController();
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 85 / 100,
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 35 / 100,
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              // header
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'inter',
                  ),
                ),
              ),
              // Form
              CustomTextField(
                title: 'Email',
                hint: 'youremail@email.com',
                obsecureText: false,
                margin: const EdgeInsets.all(0),
                controller: emailController,
                padding: const EdgeInsets.all(16),
              ),
              CustomTextField(
                title: 'Full Name',
                hint: 'Your Full Name',
                margin: const EdgeInsets.only(top: 16),
                controller: fullNameController,
                padding: const EdgeInsets.all(16),
                obsecureText: false,
              ),
              CustomTextField(
                title: 'Password',
                hint: '**********',
                obsecureText: true,
                margin: const EdgeInsets.only(top: 16),
                controller: passwordController,
                padding: const EdgeInsets.all(16),
              ),
              CustomTextField(
                title: 'Retype Password',
                hint: '**********',
                obsecureText: true,
                margin: const EdgeInsets.only(top: 16),
                controller: retypePasswordController,
                padding: const EdgeInsets.all(16),
              ),
              // Register Button
              Container(
                margin: const EdgeInsets.only(top: 32, bottom: 6),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // // Navigator.of(context).pop();
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageSwitcher()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: ColorConstant.primarySoft,
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: ColorConstant.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'inter'),
                  ),
                ),
              ),
              // Login textbutton
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    isScrollControlled: true,
                    builder: (context) {
                      return const LoginScreen();
                    },
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Have an account? ',
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        style: TextStyle(
                          color: ColorConstant.primary,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'inter',
                        ),
                        text: 'Log in',
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
