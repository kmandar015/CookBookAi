import 'package:cook_book_ai/app/core/constants/color_constant.dart';
import 'package:cook_book_ai/app/core/widgets/custom_text_field.dart';
import 'package:cook_book_ai/app/core/widgets/page_switcher.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 85 / 100,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 35 / 100,
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 6,
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
                ),
              ),
              // Header
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700, fontFamily: 'inter'),
                ),
              ),
              // Form
              CustomTextField(
                title: 'Email',
                hint: 'youremail@email.com',
                controller: emailController,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(top: 10),
                obsecureText: false,
              ),
              CustomTextField(
                title: 'Password',
                hint: '**********',
                controller: passwordController,
                obsecureText: true,
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(16),
              ),
              // Login Button
              Container(
                margin: const EdgeInsets.only(top: 32, bottom: 6),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageSwitcher()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: ColorConstant.primarySoft,
                  ),
                  child: Text('Login', style: TextStyle(color: ColorConstant.secondary, fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'inter')),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Forgot your password? ',
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        style: TextStyle(
                          color: ColorConstant.primary,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'inter',
                        ),
                        text: 'Reset',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
