import "package:cook_book_ai/app/features/auth/login_screen.dart";
import "package:cook_book_ai/app/features/auth/register_screen.dart";
import "package:flutter/material.dart";
import "../core/constants/color_constant.dart";

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 60 / 100,
                decoration:
                    BoxDecoration(gradient: ColorConstant.linearBlackBottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text('Hungry?',
                              style: TextStyle(
                                  fontFamily: 'inter',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32,
                                  color: Colors.white)),
                        ),
                        Text("Help you when you're hungry",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Get Started Button
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                isScrollControlled: true,
                                builder: (context) {
                                  return const RegisterScreen();
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: ColorConstant.primarySoft,
                            ),
                            child: Text('Get Started',
                                style: TextStyle(
                                    color: ColorConstant.secondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'inter')),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Log in Button
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: OutlinedButton(
                            onPressed: () {
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
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              side: BorderSide(
                                  color:
                                      ColorConstant.secondary.withOpacity(0.5),
                                  width: 1),
                            ),
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                  color: ColorConstant.secondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'inter'),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          margin: const EdgeInsets.only(top: 32),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'By joining Hungry, you agree to our ',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  height: 150 / 100),
                              children: [
                                TextSpan(
                                  text: 'Terms of service ',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontWeight: FontWeight.w700,
                                      height: 150 / 100),
                                ),
                                TextSpan(
                                  text: 'and ',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      height: 150 / 100),
                                ),
                                TextSpan(
                                  text: 'Privacy policy.',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontWeight: FontWeight.w700,
                                      height: 150 / 100),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
