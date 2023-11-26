import 'package:cp_book_store/common/color_extension.dart';
import 'package:cp_book_store/common_widget/round_button.dart';
import 'package:cp_book_store/view/login/sign_in_view.dart';
import 'package:cp_book_store/view/login/sign_up_view.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/img/welcome_bg.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Container(
              width: media.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: media.width * 0.25,
                  ),
                  Text(
                    "Books For\nEvery Taste.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.primary,
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.2,
                  ),
                  RoundButton(
                      title: "Sign In",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInView(),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundButton(
                      title: "Sign Up",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpView(),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
